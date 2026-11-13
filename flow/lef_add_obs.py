# lef_add_obs.py - Add OBS to a routing LEF for every metal1 / metal2 shape in SCL's cell GDS that the LEF does
# not describe (no PIN or OBS covers it). SCL's core_c1d.lef leaves out some internal metal (e.g. INVR04,
# DFCL11, MX2101 metal2), so the router can route through it: silent shorts in LVS, 10.1.1 spacing in DRC.
# Pieces that touch a PIN of the cell are skipped (remnants of snap_lef's inward pin shrink).
# Usage: klayout -b -rd lefin=<snapped.lef> -rd gds=<core_c1d.gds> -rd lefout=<route.lef> -r flow/lef_add_obs.py
import pya, re
G = 0.005
lef = open(lefin).read()
ly = pya.Layout(); ly.read(gds)
GL = {"metal1": 8, "metal2": 10}
def rects_raw(body, layer):
    """Like rects() but not merged, so every LEF rect gives its own seed."""
    reg = pya.Region()
    for blk in re.finditer(r"LAYER (\S+) ;(.*?)(?=LAYER|END|$)", body, re.S):
        if blk.group(1) != layer: continue
        for r in re.findall(r"RECT\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)", blk.group(2)):
            reg.insert(pya.DBox(*[float(v) for v in r]).to_itype(ly.dbu))
    return reg
def seeds(reg):
    """1 dbu boxes at each LEF rect centre: picks the GDS polygon a pin really is, not ones its rect touches."""
    out = pya.Region()
    for p in reg.each():
        c = p.bbox().center(); out.insert(pya.Box(c.x - 1, c.y - 1, c.x + 1, c.y + 1))
    return out
def rects(body, layer):
    reg = pya.Region()
    for blk in re.finditer(r"LAYER (\S+) ;(.*?)(?=LAYER|END|$)", body, re.S):
        if blk.group(1) != layer: continue
        for r in re.findall(r"RECT\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)", blk.group(2)):
            reg.insert(pya.DBox(*[float(v) for v in r]).to_itype(ly.dbu))
    return reg
def sn_lo(v): return round(int(v / G + 1e-9) * G, 3) if v >= 0 else round(-int(-v / G + 0.999999) * G, 3)
def sn_hi(v): return -sn_lo(-v)
out, total = lef, 0
def newpins(body, pinadd):
    """Body text with the metal to be added to each PIN already inserted (same as the final edit below)."""
    nb = body
    for pn, lst in pinadd.items():
        nb = re.sub(r"(\n\s*PIN %s\b.*?\n\s*PORT\s*\n)" % re.escape(pn), lambda mm: mm.group(1) + "".join(lst), nb, count=1, flags=re.S)
    return nb
for m in re.finditer(r"\n(?:MACRO|macro) (\S+)(.*?)\nEND \1", lef, re.S):
    name, body = m.group(1), m.group(2)
    c = ly.cell(name)
    if c is None: continue
    # Each pin's electrical extent in the GDS (metal1 / via1 / metal2 connectivity from its LEF shapes). Uncovered
    # metal tied to a pin is added to that PIN (router keeps other nets at spacing, same net may touch it); the
    # rest is internal-net metal and becomes OBS.
    gm1 = pya.Region(c.begin_shapes_rec(ly.layer(8, 0))).merged()
    gv1 = pya.Region(c.begin_shapes_rec(ly.layer(9, 0))).merged()
    gm2 = pya.Region(c.begin_shapes_rec(ly.layer(10, 0))).merged()
    pinadd, conn_all, obs_pin, obs_sup = {}, {"metal1": pya.Region(), "metal2": pya.Region()}, [], []
    sig_m1 = pya.Region()                           # Signal-pin metal1 (+2 um): keep metal2 above it open for vias
    for pm in re.finditer(r"\n\s*PIN (\S+)(.*?)\n\s*END \1", body, re.S):
        if pm.group(1) not in ("VDD", "VSS"): sig_m1 += rects(pm.group(2), "metal1").sized(int(2 / ly.dbu))
    for pm in re.finditer(r"\n\s*PIN (\S+)(.*?)\n\s*END \1", body, re.S):
        pn, ptxt = pm.group(1), pm.group(2)
        a1 = gm1.interacting(seeds(rects_raw(ptxt, "metal1"))); a2 = gm2.interacting(seeds(rects_raw(ptxt, "metal2")))
        for _ in range(6):
            v = gv1.interacting(a1) + gv1.interacting(a2)
            a2 = (a2 + gm2.interacting(v)).merged(); a1 = (a1 + gm1.interacting(v)).merged()
        conn = {"metal1": a1, "metal2": a2}
        supply = pn in ("VDD", "VSS")
        SP = {"metal1": 1.5, "metal2": 1.7}
        for lay in GL:
            extra = (conn[lay] - rects(body, lay)).merged()
            conn_all[lay] += conn[lay]
            if lay == "metal2" and supply:
                # Supply metal2 -> OBS (OpenROAD crashes on metal2 shapes of VDD/VSS pins: "cannot find layer")
                obs_sup.append(extra); continue
            # Pin metal the LEF lacks is added to the PIN, but only where routed metal of this net may legally sit:
            # >= min spacing (metal1 1.5, metal2 1.7 um) from the cell's other-net metal. SCL's own cell may have
            # closer gaps (DFCL11 D strip is 1.2 um from internal metal2): wires there fail DRC 10.1.1.
            # The clipped-off rest stays within spacing of the declared pin, so no other net can reach it.
            other = (gm1 if lay == "metal1" else gm2) - conn[lay]
            ok = (extra - other.sized(int(SP[lay] / ly.dbu))).merged()
            for q in ok.decompose_trapezoids_to_region().each():   # exact rectangles, never a bbox over real gaps
                b = q.bbox().to_dtype(ly.dbu)
                if b.width() < 0.2 or b.height() < 0.2: continue
                pinadd.setdefault(pn, []).append("      LAYER %s ;\n        RECT %.3f %.3f %.3f %.3f ;\n" % (lay, sn_hi(b.left), sn_hi(b.bottom), sn_lo(b.right), sn_lo(b.top)))
    add = list(obs_pin)
    # via1 OBS where a via's 2.5 um metal2 pad on pin metal2 would come within 1.7 um of the cell's other metal2
    # (DFCL11 D strip sits 1.2 um from internal metal2): cut centre must stay 1.7 + 1.25 um away, i.e. cut
    # edges 2.2 um. There the router joins the pin with a plain metal2 wire instead.
    for pm in re.finditer(r"\n\s*PIN (\S+)(.*?)\n\s*END \1", newpins(body, pinadd), re.S):
        pn, ptxt = pm.group(1), pm.group(2)
        if pn in ("VDD", "VSS"): continue
        mine = rects(ptxt, "metal2")
        if mine.is_empty(): continue
        others = (gm2 - mine.sized(1)).merged()
        bad = (mine & others.sized(int(2.2 / ly.dbu))).merged()
        for q in bad.each():
            b = q.bbox().to_dtype(ly.dbu)
            add.append("      LAYER via1 ;\n        RECT %.3f %.3f %.3f %.3f ;\n" % (sn_lo(b.left), sn_lo(b.bottom), sn_hi(b.right), sn_hi(b.top)))
    for r in obs_sup:                               # Supply metal2 (e.g. VDDCON's TIEHI is VDD metal) minus via sites
        for q in (r - sig_m1).each():
            b = q.bbox().to_dtype(ly.dbu)
            if b.width() < 0.2 or b.height() < 0.2: continue
            add.append("      LAYER metal2 ;\n        RECT %.3f %.3f %.3f %.3f ;\n" % (sn_lo(b.left), sn_lo(b.bottom), sn_hi(b.right), sn_hi(b.top)))
    for lay, gl in GL.items():
        g = pya.Region(c.begin_shapes_rec(ly.layer(gl, 0))).merged()
        for p in (g - rects(body, lay) - conn_all[lay]).merged().each():
            b = p.bbox().to_dtype(ly.dbu)
            if b.width() < 0.2 and b.height() < 0.2: continue          # snapping slivers
            add.append("      LAYER %s ;\n        RECT %.3f %.3f %.3f %.3f ;\n" % (lay, sn_lo(b.left), sn_lo(b.bottom), sn_hi(b.right), sn_hi(b.top)))
    # Every via1 cut in the cell GDS that the LEF does not list -> via1 OBS (router keeps via spacing to it)
    for q in (gv1 - rects(body, "via1")).merged().each():
        b = q.bbox().to_dtype(ly.dbu)
        add.append("      LAYER via1 ;\n        RECT %.3f %.3f %.3f %.3f ;\n" % (sn_lo(b.left), sn_lo(b.bottom), sn_hi(b.right), sn_hi(b.top)))
    # SCL's own signal-pin metal1 rects: keep only the part >= 1.5 um from other-net metal1 (same rule as above)
    pinclip = {}
    for pm in re.finditer(r"\n\s*PIN (\S+)(.*?)\n\s*END \1", body, re.S):
        pn, ptxt = pm.group(1), pm.group(2)
        if pn in ("VDD", "VSS"): continue
        a1 = gm1.interacting(seeds(rects_raw(ptxt, "metal1"))); a2 = gm2.interacting(seeds(rects_raw(ptxt, "metal2")))
        for _ in range(6):
            v = gv1.interacting(a1) + gv1.interacting(a2)
            a2 = (a2 + gm2.interacting(v)).merged(); a1 = (a1 + gm1.interacting(v)).merged()
        orig = rects(ptxt, "metal1")
        legal = (orig - (gm1 - a1).sized(int(1.5 / ly.dbu))).merged()
        if (orig - legal).is_empty(): continue
        pinclip[pn] = ["        RECT %.3f %.3f %.3f %.3f ;\n" % (sn_hi(b.left), sn_hi(b.bottom), sn_lo(b.right), sn_lo(b.top))
                       for b in (q.bbox().to_dtype(ly.dbu) for q in legal.decompose_trapezoids_to_region().each())
                       if b.width() >= 0.2 and b.height() >= 0.2]
    if not add and not pinadd and not pinclip: continue
    total += len(add)
    print("LEF_ADD_OBS: %-8s +%d OBS, pin metal added: %s" % (name, len(add), {k: len(v) for k, v in pinadd.items()}))
    newbody = body
    for pn, lst in pinclip.items():                 # Replace the clipped pin's metal1 rects
        def fix(mm, lst=lst):
            blk = mm.group(0)
            blk = re.sub(r"(LAYER metal1 ;\s*\n)(\s*RECT[^\n]*\n)+", lambda m2: m2.group(1) + "".join(lst), blk, count=1)
            return blk
        newbody = re.sub(r"\n\s*PIN %s\b.*?\n\s*END %s\b" % (re.escape(pn), re.escape(pn)), fix, newbody, count=1, flags=re.S)
        print("LEF_ADD_OBS: %-8s pin %s metal1 clipped to %d rect(s)" % (name, pn, len(lst)))
    for pn, lst in pinadd.items():                  # Append to the pin's first PORT
        newbody = re.sub(r"(\n\s*PIN %s\b.*?\n\s*PORT\s*\n)" % re.escape(pn), lambda mm: mm.group(1) + "".join(lst), newbody, count=1, flags=re.S)
    if add and re.search(r"\n\s*OBS\s*\n", newbody):
        newbody = re.sub(r"(\n\s*OBS\s*\n)", lambda mm: mm.group(1) + "".join(add), newbody, count=1)
    elif add:
        newbody = newbody + "\n  OBS\n" + "".join(add) + "  END\n"
    out = out.replace(m.group(0), "\n%s %s%s\nEND %s" % (m.group(0).split()[0], name, newbody, name), 1)
open(lefout, "w").write(out)
print("LEF_ADD_OBS: %d rects added -> %s" % (total, lefout))
