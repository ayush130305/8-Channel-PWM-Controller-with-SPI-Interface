# gen_route_lef.py - Build the routing LEF for SCL C1D cells from the cell GDS itself.
#
# Why: SCL's core_c1d.lef is an approximate abstract. Some cell metal is missing (INVR04 VDD metal2 strap,
# metal2 pin extensions on DFCL11 / MX2101 / VDDCON, internal metal1/via1), pins are small squares with the
# rest of their own metal under OBS, and the router cannot see poly / contact / diffusion. Routing against
# it gives hidden shorts (LVS), metal spacing errors next to cell metal, and via-to-poly / via-to-contact /
# via-on-diffusion-edge errors (DRC 9.4.1, 9.3.1, guideline 6).
#
# What it writes, per cell (header lines, pin names, DIRECTION / USE / SHAPE are kept from the input LEF):
#   signal PIN   metal1 / metal2 = the pin's own GDS metal (metal1/via1/metal2 connectivity from the LEF pin
#                rects), minus anything closer than min spacing (metal1 1.5, metal2 1.7 um) to other-net metal,
#                as exact rectangles (never a bounding box). Router metal anywhere on it is DRC-legal.
#   supply PIN   metal1 = the input LEF rects (rails, used for abutment / followpins).
#   OBS metal1   GDS metal1 of all other nets (internal nodes) + supply metal1 beyond the LEF rails.
#   OBS metal2   GDS metal2 of internal nets and of VDD / VSS (OpenROAD crashes on metal2 supply pin shapes).
#   OBS via1     GDS via1 cuts + contacts. LEF via1 SPACING 1.5 then keeps router cuts >= 1.5 um from contacts,
#                which is exactly rule 9.3.1. Poly / diffusion edges get no OBS: SCL's 9.4.1 only flags a via
#                OUTSIDE poly within 1.2 um (vias on poly are legal) and guideline 6 only a via straddling a
#                diffusion edge - neither can be expressed as a cut spacing without forbidding legal vias, so the
#                few such vias are fixed after routing (via1 blockage at the DRC marker). Tested on synthetic
#                cases: checks/synth_via.gds.
# Coordinates snap to the 0.005 um grid: pins inward, OBS outward.
# Usage: klayout -b -rd lefin=<snapped.lef> -rd gds=<core_c1d.gds> -rd lefout=<route.lef> -r flow/gen_route_lef.py
import os, re, sys
import pya
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)) if '__file__' in globals() else 'flow')
import via_rules as VR

G = 0.005
try: POLY_SHRINK = float(poly_shrink)
except NameError: POLY_SHRINK = -1   # <0: no poly OBS (SCL 9.4.1 allows vias on poly; see FLOW_LOG)
try: VIA_SITES = int(via_sites)
except NameError: VIA_SITES = 1
try: DIFF_EDGE = int(diff_edge)
except NameError: DIFF_EDGE = 0
L_DIFF, L_POLY, L_CONT, L_M1, L_V1, L_M2 = 2, 4, 7, 8, 9, 10
SP = {"metal1": 1.5, "metal2": 1.7}
ly = pya.Layout(); ly.read(gds)
U = lambda v: int(round(v / ly.dbu))
txt = open(lefin).read()

def lo(v): return round(int(v / G + 1e-6) * G if v >= 0 else -int(-v / G + 1 - 1e-6) * G, 3)   # round down
def hi(v): return -lo(-v)                                                                      # round up
def region(c, layer): return pya.Region(c.begin_shapes_rec(ly.layer(layer, 0))).merged()
def lef_rects(text, layer):
    reg = pya.Region()
    for blk in re.finditer(r"LAYER (\S+) ;(.*?)(?=LAYER|END|$)", text, re.S):
        if blk.group(1) != layer: continue
        for r in re.findall(r"RECT\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)", blk.group(2)):
            reg.insert(pya.DBox(*[float(v) for v in r]).to_itype(ly.dbu))
    return reg
def seeds(reg):
    out = pya.Region()
    for p in reg.each():
        c = p.bbox().center(); out.insert(pya.Box(c.x - 1, c.y - 1, c.x + 1, c.y + 1))
    return out
def rect_lines(reg, layer, inward):
    """Exact rectangles of a Manhattan region; non-rectangular (diagonal) pieces: skipped for pins, bbox for OBS."""
    out = []
    for q in reg.merged().decompose_trapezoids_to_region().each():
        b = q.bbox().to_dtype(ly.dbu)
        if inward and not q.is_box():
            # Horizontal trapezoid (45-degree sides): its inscribed rectangle spans the inner x of top and bottom
            # edges. The leftover triangles touch it, so no other net can reach them (audit checks this).
            pts = [p.to_dtype(ly.dbu) for p in q.each_point_hull()]
            yb, yt = b.bottom, b.top
            xb = sorted(p.x for p in pts if abs(p.y - yb) < 1e-6); xt = sorted(p.x for p in pts if abs(p.y - yt) < 1e-6)
            if len(xb) >= 2 and len(xt) >= 2:
                b = pya.DBox(max(xb[0], xt[0]), yb, min(xb[-1], xt[-1]), yt)
            else:
                continue
        if True:
            if inward:
                x1, y1, x2, y2 = hi(b.left), hi(b.bottom), lo(b.right), lo(b.top)
                if x2 - x1 < 0.2 or y2 - y1 < 0.2: continue
            else:
                x1, y1, x2, y2 = lo(b.left), lo(b.bottom), hi(b.right), hi(b.top)
            out.append("        RECT %.3f %.3f %.3f %.3f ;\n" % (x1, y1, x2, y2))
    return ("      LAYER %s ;\n" % layer + "".join(out)) if out else ""

out_txt, n_cells = txt, 0
for m in re.finditer(r"\n(?:MACRO|macro) (\S+)\n(.*?)\nEND \1", txt, re.S):
    name, body = m.group(1), m.group(2)
    c = ly.cell(name)
    if c is None: continue
    gm1, gv1, gm2 = region(c, L_M1), region(c, L_V1), region(c, L_M2)
    pin_blocks = list(re.finditer(r"(\n\s*PIN (\S+)\n)(.*?)(\n\s*END \2\b)", body, re.S))
    head = body[:pin_blocks[0].start()] if pin_blocks else body
    used = {"metal1": pya.Region(), "metal2": pya.Region()}
    new_pins = []
    pin_far = {"metal1": pya.Region(), "metal2": pya.Region()}
    lc_all = pya.Region()                                   # legal via centres of all signal pins
    for pb in pin_blocks:
        pn, ptxt = pb.group(2), pb.group(3)
        attrs = "".join(l + "\n" for l in ptxt.split("\n") if re.match(r"\s*(DIRECTION|USE|SHAPE)\b", l))
        a1 = gm1.interacting(seeds(lef_rects(ptxt, "metal1"))); a2 = gm2.interacting(seeds(lef_rects(ptxt, "metal2")))
        for _ in range(8):                                    # metal1 / via1 / metal2 connectivity
            v = gv1.interacting(a1) + gv1.interacting(a2)
            a1 = (a1 + gm1.interacting(v)).merged(); a2 = (a2 + gm2.interacting(v)).merged()
        used["metal1"] += a1; used["metal2"] += a2
        if pn in ("VDD", "VSS"):
            rails = [r for b in re.finditer(r"LAYER (\S+) ;(.*?)(?=LAYER|END|$)", ptxt, re.S) if b.group(1) == "metal1"
                     for r in re.findall(r"RECT\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)", b.group(2))]
            geo = "      LAYER metal1 ;\n" + "".join("        RECT %s ;\n" % " ".join(r) for r in rails)
            new_pins.append((pn, attrs, geo, a1, a2))
            continue
        geo = ""
        for lay, reg, g in (("metal2", a2, gm2), ("metal1", a1, gm1)):
            legal = (reg - (g - reg).sized(U(SP[lay])))
            if lay == "metal1" and VIA_SITES:
                # Routed with via-in-pin: a via may go anywhere its metal1 pad fits inside the declared pin. So the
                # pin is declared as exactly the union of legal via pads (centres Lc, pad +-1.25 um), from SCL's
                # rules as measured (checks/synth_via.gds): cut overlaps poly or is >= 1.2 um from it (9.4.1),
                # cut fully inside or fully outside diffusion (guideline 6), >= 1.5 um from contacts (9.3.1)
                # and from existing cuts (9.2.1).
                frame = pya.Region(c.bbox().enlarged(U(20), U(20)))
                def dil(r, d): return r.minkowski_sum(pya.Box(-U(d), -U(d), U(d), U(d))).merged()
                def ero(r, d): return (r - dil(frame - r, d)).merged()
                poly, diff, cont = region(c, L_POLY), region(c, L_DIFF), region(c, L_CONT)
                # Rule distances exact (box metric, conservative at corners; boundary positions dropped):
                c_poly = dil(poly, 0.745) + (frame - dil(poly, 1.2 + 0.75))   # cut overlaps poly by >= 5 nm, or >= 1.2 away
                c_diff = ero(diff, 0.75) + (frame - dil(diff, 0.75))          # cut fully inside or fully outside diffusion
                c_cont = frame - dil(cont, 1.5 + 0.75)                        # cut >= 1.5 um from contacts
                c_via = frame - dil(gv1, 1.5 + 0.75)                          # and from existing via1 cuts
                # 1.245 not 1.25: SCL pin strips are often exactly 2.5 um wide (= via pad), whose legal centres form
                # a zero-width line that an exact erosion would lose.
                # Forbidden via-centre zones from SCL's deck rules, exact on the 5 nm manufacturing grid (closed regions;
                # e.g. a cut edge exactly 1.200 um from poly is legal, so centres up to 1.945 um in front are forbidden):
                #  9.4.1 via.separation(poly,1.2): a cut edge facing a poly edge from outside across < 1.2 um. For each
                #        poly edge: centres 0.75..1.95 um in front of it (a cut straddling the edge is legal).
                #  9.3.1 contact: centres within 0.75 + 1.5 of a contact (incl. overlap / touching).
                #  G6    cut touching / straddling a diffusion edge: centres within 0.75 of the edge.
                #  9.2.1 existing cell cuts: centres within 0.75 + 1.5.
                fz = pya.Region()
                for e in poly.edges().each():
                    # along the edge +-(0.75 + 1.2): the deck measures Euclidean, so a cut corner diagonally within 1.2 um
                    # of a poly corner is flagged too (box metric here: conservative at corners)
                    near = pya.Edges([e]).extended(U(1.945), U(1.945), U(1.945), 0, False)
                    close = pya.Edges([e]).extended(U(0.75), U(0.75), U(0.745), 0, False)
                    fz += (near - close)
                fz += dil(cont, 2.245) + dil(gv1, 2.245)
                fz += (dil(diff, 0.75) - ero(diff, 0.75))
                lc_ok = (ero(legal, 1.245) - fz).merged()
                # Pin metal1 = pad containers only: for every rectangle of legal centres lc, the rectangle that holds
                # exactly its pads (centre rect +-1.245). OpenROAD needs a via pad inside ONE pin rect, so any via it
                # can place has its centre inside lc (strictly, 5 nm inside). No union, no tolerance.
                # Pin metal1 = pad containers: per rectangle of legal centres lc, the rectangle holding its pads (+-1.245).
                # OpenROAD checks via-in-pin against the MERGED pin shape (measured), so where containers touch, a pad can
                # fit across them with its centre in neither: such straddle centres = erosion of the union by exactly
                # 1.25 minus lc. Remove lc around them (growing radius) until there are none. No tolerance needed:
                # away from junctions the erosion lies 5 nm inside lc.
                def containers(lcr):
                    rr = pya.Region(); ll = []
                    for q in lcr.decompose_trapezoids_to_region().each():
                        bq = q.bbox().to_dtype(ly.dbu)
                        if not q.is_box():
                            pts = [p.to_dtype(ly.dbu) for p in q.each_point_hull()]
                            xb = sorted(p.x for p in pts if abs(p.y - bq.bottom) < 1e-6); xt = sorted(p.x for p in pts if abs(p.y - bq.top) < 1e-6)
                            if len(xb) < 2 or len(xt) < 2: continue
                            bq = pya.DBox(max(xb[0], xt[0]), bq.bottom, min(xb[-1], xt[-1]), bq.top)
                        x1, y1, x2, y2 = hi(bq.left - 1.245), hi(bq.bottom - 1.245), lo(bq.right + 1.245), lo(bq.top + 1.245)
                        if x2 - x1 < 2.5 - 1e-6 or y2 - y1 < 2.5 - 1e-6: continue
                        ll.append("        RECT %.3f %.3f %.3f %.3f ;\n" % (x1, y1, x2, y2))
                        rr.insert(pya.DBox(x1, y1, x2, y2).to_itype(ly.dbu))
                    return rr.merged(), ll
                lc = lc_ok
                for it in range(15):
                    cont_r, lines = containers(lc)
                    stray = (ero(cont_r, 1.245) - lc_ok).merged()     # containers are centre rects +-1.245: exact
                    if stray.is_empty(): break
                    lc = (lc - dil(stray, min(0.25 * (it + 1), 2.5))).merged()
                cont_r, lines = containers(lc)
                left = (ero(cont_r, 1.245) - lc_ok).merged()
                if not left.is_empty():
                    print("GEN_ROUTE_LEF: WARNING %s/%s straddle centres remain at %s" % (name, pn, left.bbox().to_dtype(ly.dbu)))
                lc_all += lc
                decl = cont_r.merged()
                if decl.is_empty():
                    if a2.is_empty():
                        print("GEN_ROUTE_LEF: %s/%s NO DRC-legal via site and no metal2: cell must not be used" % (name, pn))
                        decl = legal; geo += rect_lines(legal, lay, inward=True)
                    else:
                        print("GEN_ROUTE_LEF: %s/%s no legal via site on metal1: metal2-only pin" % (name, pn))
                else:
                    geo += "      LAYER metal1 ;\n" + "".join(lines)
                far = (legal - decl)                                # undeclared pin metal: OBS so other nets keep spacing to it
                pin_far[lay] += far
                continue
            geo += rect_lines(legal, lay, inward=True)

        new_pins.append((pn, attrs, geo, a1, a2))
    # OBS
    sup1 = pya.Region(); sup2 = pya.Region(); sup_lef1 = pya.Region()
    for pn, attrs, geo, a1, a2 in new_pins:
        if pn in ("VDD", "VSS"):
            sup1 += a1; sup2 += a2; sup_lef1 += lef_rects(geo, "metal1")
    sig1 = pya.Region(); sig2 = pya.Region()
    for pn, attrs, geo, a1, a2 in new_pins:
        if pn not in ("VDD", "VSS"): sig1 += a1; sig2 += a2
    obs1 = (gm1 - sig1 - sup_lef1 + pin_far["metal1"]).merged()                 # internal nets + supply metal1 beyond the rails
    obs2 = (gm2 - sig2).merged()                            # internal nets + supply metal2
    diff = region(c, L_DIFF)
    dedge = diff.edges().extended(U(0.01), U(0.01), U(0.01), U(0.01), False)
    # Router keeps cuts 1.5 um (LEF via1 SPACING) from via1 OBS: contact as drawn -> 1.5 um (rule 9.3.1);
    # poly shrunk by POLY_SHRINK (0.3) -> 1.2 um (rule 9.4.1). DIFF_EDGE=1 adds diffusion edges (guideline 6,
    # conservative: 1.5 um instead of "not straddling").
    polyk = region(c, L_POLY).sized(-U(POLY_SHRINK)) if POLY_SHRINK >= 0 else pya.Region()
    obsv = (gv1 + region(c, L_CONT) + polyk + (dedge if DIFF_EDGE else pya.Region())).merged()
    if VIA_SITES:
        # Vias the router drops while switching layers over a cell (not on a pin): keep them off poly and
        # diffusion edges (cut >= 1.5 um from them, covers 9.4.1 and guideline 6). Not near the pins' legal via
        # sites (cut keep-out 1.5 + half cut 0.75 around each legal centre), so pin access is unchanged.
        fr = pya.Region(c.bbox().enlarged(U(20), U(20)))
        keep = (region(c, L_POLY) + dedge).merged() - lc_all.minkowski_sum(pya.Box(-U(2.26), -U(2.26), U(2.26), U(2.26)))
        obsv = (obsv + keep).merged()
    obs = "  OBS\n" + rect_lines(obs1, "metal1", False) + rect_lines(obs2, "metal2", False) + rect_lines(obsv, "via1", False) + "  END\n"
    pins_txt = "".join("  PIN %s\n%s    PORT\n%s    END\n  END %s\n" % (pn, attrs, geo, pn) for pn, attrs, geo, a1, a2 in new_pins)
    head = re.sub(r"\n\s*OBS\b.*", "", head, flags=re.S)
    new_body = head.rstrip("\n") + "\n" + pins_txt + obs
    out_txt = out_txt.replace(m.group(0), "\n%s %s\n%s\nEND %s" % (m.group(0).split()[0], name, new_body.rstrip("\n"), name), 1)
    n_cells += 1
open(lefout, "w").write(out_txt)
print("GEN_ROUTE_LEF: %d cells rebuilt from GDS -> %s" % (n_cells, lefout))
