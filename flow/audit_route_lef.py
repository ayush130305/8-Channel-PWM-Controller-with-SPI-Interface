# audit_route_lef.py - Check a routing LEF against SCL's cell GDS before any routing.
# For every cell given:
#   1. COVERAGE: every GDS metal1 / metal2 / via1 shape is inside a LEF PIN or OBS, or so close to a declared
#      shape (< min spacing) that no other net's wire can legally reach it. Else: hidden shorts.
#   2. PIN LEGALITY: every declared signal-pin shape is >= min spacing (metal1 1.5, metal2 1.7 um) from the
#      cell's other-net GDS metal. Else router metal on the pin fails DRC although the router accepts it.
#   3. PIN ACCESS (router's view: LEF pins + OBS only): each signal pin has a via1 site - 2.5 um metal1 pad inside
#      the merged pin metal1 (OpenROAD via-in-pin, measured), >= 1.5 um from via1 OBS; 2.5 um metal1 pad >= 1.5 um from metal1 OBS / other pins; 2.5 um metal2
#      pad >= 1.7 um from metal2 OBS / other pins - or a planar metal2 lane from its metal2 to the cell edge.
# Usage: klayout -b -rd lef=<route.lef> -rd gds=<core_c1d.gds> -rd cells=<A,B,...> -r flow/audit_route_lef.py
import os, sys, pya, re
sys.path.insert(0, 'flow')
import via_rules as VR
ly = pya.Layout(); ly.read(gds)
txt = open(lef).read()
U = lambda v: int(round(v / ly.dbu))
SP = {"metal1": 1.5, "metal2": 1.7}
def rects(body, layer):
    reg = pya.Region()
    for blk in re.finditer(r"LAYER (\S+) ;(.*?)(?=LAYER|END|$)", body, re.S):
        if blk.group(1) != layer: continue
        for r in re.findall(r"RECT\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)", blk.group(2)):
            reg.insert(pya.DBox(*[float(v) for v in r]).to_itype(ly.dbu))
    return reg.merged()
def seeds(reg):
    out = pya.Region()
    for p in reg.each():
        for q in pya.Region(p).decompose_trapezoids_to_region().each():
            c = q.bbox().center(); out.insert(pya.Box(c.x - 1, c.y - 1, c.x + 1, c.y + 1))
    return out
def g(c, l): return pya.Region(c.begin_shapes_rec(ly.layer(l, 0))).merged()

bad = 0
for name in cells.split(","):
    m = re.search(r"\n(?:MACRO|macro) %s\n(.*?)\nEND %s" % (name, name), txt, re.S)
    c = ly.cell(name)
    if not m or c is None: print("%-7s MISSING in LEF or GDS" % name); bad += 1; continue
    body = m.group(1)
    pins = {p.group(1): p.group(2) for p in re.finditer(r"\n\s*PIN (\S+)\n(.*?)\n\s*END \1\b", body, re.S)}
    om = re.search(r"\n\s*OBS\n(.*?)\n\s*END\b", body, re.S); obs = om.group(1) if om else ""
    gm1, gv1, gm2 = g(c, 8), g(c, 9), g(c, 10)
    issues, notes = [], []
    # 1. coverage
    for lay, gr in (("metal1", gm1), ("via1", gv1), ("metal2", gm2)):
        cov = rects(obs, lay)
        for pt in pins.values(): cov += rects(pt, lay)
        un = gr - cov.merged()
        if lay != "via1": un = un - cov.merged().sized(U(SP[lay]))
        un = pya.Region([p for p in un.each() if p.bbox().width() > U(0.05) and p.bbox().height() > U(0.05)])
        if not un.is_empty(): issues.append("%s uncovered %d (e.g. %s)" % (lay, un.count(), un.bbox().to_dtype(ly.dbu)))
    o1, o2, ov = rects(obs, "metal1"), rects(obs, "metal2"), rects(obs, "via1")
    H = c.bbox().top
    for pn, pt in pins.items():
        if pn in ("VDD", "VSS"): continue
        d1, d2 = rects(pt, "metal1"), rects(pt, "metal2")
        # GDS electrical extent of this pin
        a1 = gm1.interacting(seeds(d1)); a2 = gm2.interacting(seeds(d2))
        for _ in range(8):
            v = gv1.interacting(a1) + gv1.interacting(a2)
            a1 = (a1 + gm1.interacting(v)).merged(); a2 = (a2 + gm2.interacting(v)).merged()
        # 2. legality
        for lay, d, oth in (("metal1", d1, gm1 - a1), ("metal2", d2, gm2 - a2)):
            cl = d & oth.sized(U(SP[lay]) - 1)
            if not cl.is_empty(): issues.append("pin %s %s too close to other-net metal at %s" % (pn, lay, cl.bbox().to_dtype(ly.dbu)))
        # 3. access, router's view
        # OBS touching this pin's declared metal is the pin's own undeclared metal (flow/gen_route_lef.py); OpenROAD
        # does not hold it against the pin's access (measured: SCL's own LEF overlaps pins with OBS).
        oth1 = o1.not_interacting(d1); oth2 = o2.not_interacting(d2) if not d2.is_empty() else o2.dup()
        for q, t in pins.items():
            if q != pn: oth1 += rects(t, "metal1"); oth2 += rects(t, "metal2")
        oth1 = (oth1 - d1).merged(); oth2 = (oth2 - d2).merged()
        # 4. VIA LEGALITY (via-in-pin routing): every via whose metal1 pad fits inside the declared pin has a
        #    DRC-legal cut (exact SCL rules: overlaps poly or >= 1.2 um away; fully in or out of diffusion;
        #    >= 1.5 um from contacts and existing cuts). Sampled on a 0.25 um grid.
        poly, diff, cont = g(c, 4), g(c, 2), g(c, 7)
        d1_rects_reg = pya.Region(); d1_rects_reg.merged_semantics = False
        for blk in re.finditer(r"LAYER (\S+) ;(.*?)(?=LAYER|END|$)", pt, re.S):
            if blk.group(1) == "metal1":
                for r in re.findall(r"RECT\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)", blk.group(2)):
                    d1_rects_reg.insert(pya.DBox(*[float(v) for v in r]).to_itype(ly.dbu))
        badv = 0; tot = 0
        cutsel = pya.Region(); cutsel.merged_semantics = False
        seenc = set()
        for p in d1_rects_reg.each():   # 0.05 um grid anchored at both edges of every rectangle
            b = p.bbox()
            xs = sorted(set(list(range(b.left + U(1.25), b.right - U(1.25) + 1, U(0.05))) + list(range(b.right - U(1.25), b.left + U(1.25) - 1, -U(0.05)))))
            ys = sorted(set(list(range(b.bottom + U(1.25), b.top - U(1.25) + 1, U(0.05))) + list(range(b.top - U(1.25), b.bottom + U(1.25) - 1, -U(0.05)))))
            # also centres a pad can take across touching rectangles: sample the union bbox on the same anchors
            for x in xs:
                for y in ys:
                    if (x, y) in seenc: continue
                    seenc.add((x, y))
                    pad = pya.Region(pya.Box(x - U(1.25), y - U(1.25), x + U(1.25), y + U(1.25)))
                    if (pad - d1).is_empty():                  # OpenROAD via-in-pin: pad inside the MERGED pin shape
                        tot += 1
                        cutsel.insert(pya.Box(x - U(0.75), y - U(0.75), x + U(0.75), y + U(0.75)))
        ub = d1.bbox()
        for x in range(ub.left + U(1.25), ub.right - U(1.25) + 1, U(0.05)):
            for y in range(ub.bottom + U(1.25), ub.top - U(1.25) + 1, U(0.05)):
                if (x, y) in seenc: continue
                pad = pya.Region(pya.Box(x - U(1.25), y - U(1.25), x + U(1.25), y + U(1.25)))
                if (pad - d1).is_empty():
                    seenc.add((x, y)); tot += 1
                    cutsel.insert(pya.Box(x - U(0.75), y - U(0.75), x + U(0.75), y + U(0.75)))
        if tot:
            okc = VR.legal_cuts(cutsel, poly, diff, cont, gv1, U)
            badv = cutsel.count() - okc.count()
        if badv: issues.append("pin %s: %d of %d via positions illegal (SCL deck rules)" % (pn, badv, tot))
        d1_rects = [pya.DBox(*[float(v) for v in r]).to_itype(ly.dbu) for blk in re.finditer(r"LAYER (\S+) ;(.*?)(?=LAYER|END|$)", pt, re.S)
                    if blk.group(1) == "metal1" for r in re.findall(r"RECT\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)", blk.group(2))]
        site = None
        for p in d1.decompose_trapezoids_to_region().each():
            b = p.bbox(); x = b.left + U(0.75)
            while x <= b.right - U(0.75) and site is None:
                y = b.bottom + U(0.75)
                while y <= b.top - U(0.75) and site is None:
                    cut = pya.Region(pya.Box(x - U(0.75), y - U(0.75), x + U(0.75), y + U(0.75)))
                    pad = cut.sized(U(0.5))
                    if (pad - d1).is_empty() and (cut.sized(U(1.5) - 1) & ov).is_empty() \
                            and (pad.sized(U(1.5) - 1) & oth1).is_empty() and (pad.sized(U(1.7) - 1) & oth2).is_empty():
                        site = (x * ly.dbu, y * ly.dbu)
                    y += U(0.1)
                x += U(0.1)
        if site: continue
        lane = None
        for p in d2.each():
            b = p.bbox(); x = b.left + U(1.25)
            while x <= b.right - U(1.25) and lane is None:
                for y0, y1, dname in ((b.top - U(2.3), H, "up"), (0, b.bottom + U(2.3), "down")):
                    w = pya.Region(pya.Box(x - U(1.25), y0, x + U(1.25), y1))
                    if (w.sized(U(1.7) - 1) & oth2).is_empty():
                        lane = (x * ly.dbu, dname); break
                x += U(0.05)
        if lane: notes.append("pin %s: metal2-only access (lane x=%.2f %s)" % (pn, lane[0], lane[1]))
        else: issues.append("pin %s: NO legal access (no via1 site, no metal2 lane)" % pn)
    if issues: bad += 1; print("%-7s %s" % (name, "; ".join(issues + notes)))
    else: print("%-7s OK%s" % (name, ("  [" + "; ".join(notes) + "]") if notes else ""))
print("AUDIT: %d of %d cells with issues" % (bad, len(cells.split(","))))
