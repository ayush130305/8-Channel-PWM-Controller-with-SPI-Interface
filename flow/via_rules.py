# via_rules.py - SCL C1D via1 placement rules, written with the same KLayout region operations as SCL's deck
# (libs.tech/klayout/tech/drc/c1d_drc.drc). Shared by flow/gen_route_lef.py and flow/audit_route_lef.py.
#   9.2.1  via.space(1.5)                                   -> >= 1.5 um from other via1 cuts
#   9.3.1  via.separation(contact,1.5) + via.and(contact) + via.interacting(contact)
#   9.4.1  via.separation(poly,1.2)                         (a via ON poly is fine unless one of its edges faces a
#                                                            poly edge across a < 1.2 um gap, e.g. in a poly notch)
#   G6     via.and(diffusion).interacting(via - diffusion)  -> via fully inside or fully outside diffusion
# legal_cuts(cuts, poly, diff, cont, vias, U) takes a Region of candidate cut boxes (merged semantics off, one
# polygon per candidate) and returns the subset that passes all four.
import pya

def legal_cuts(cuts, poly, diff, cont, vias, U):
    cuts = cuts.dup(); cuts.merged_semantics = False
    bad = pya.Region(); bad.merged_semantics = False
    ep = cuts.separation_check(poly, U(1.2))                       # 9.4.1
    if not ep.is_empty(): bad += cuts.interacting(ep.first_edges())
    ep = cuts.separation_check(cont, U(1.5))                       # 9.3.1
    if not ep.is_empty(): bad += cuts.interacting(ep.first_edges())
    bad += cuts.interacting(cont)
    if not vias.is_empty():                                        # 9.2.1 (existing cell cuts)
        bad += cuts.interacting(vias.sized(U(1.5) - 1))
    straddle = cuts.interacting(diff).not_inside(diff)             # G6
    bad += straddle
    return _minus(cuts, bad)

def _minus(cuts, bad):
    """Candidates not in bad (identity by box, since merged semantics are off)."""
    badset = {p.bbox() for p in bad.each()}
    out = pya.Region(); out.merged_semantics = False
    for p in cuts.each():
        if p.bbox() not in badset: out.insert(p)
    return out

def candidate_cuts(centre_region, U, step=0.1):
    """Cut boxes (1.5 um) at grid points inside centre_region; the grid is aligned to each rectangle of its
    decomposition (left/bottom edges and the right/top edges), so exactly-legal centre lines are sampled."""
    cuts = pya.Region(); cuts.merged_semantics = False
    seen = set()
    for q in centre_region.decompose_trapezoids_to_region().each():
        b = q.bbox()
        xs = list(range(b.left, b.right + 1, U(step))) + [b.right]
        ys = list(range(b.bottom, b.top + 1, U(step))) + [b.top]
        for x in xs:
            for y in ys:
                if (x, y) in seen: continue
                seen.add((x, y))
                if q.is_box() or q.inside(pya.Point(x, y)):
                    cuts.insert(pya.Box(x - U(0.75), y - U(0.75), x + U(0.75), y + U(0.75)))
    return cuts
