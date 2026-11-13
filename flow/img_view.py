# img_view.py - Render one GDS (its top cell, or a named cell) to PNG with SCL's layer colours (KLayout batch).
# Usage: klayout -b -rd gds=<file.gds> -rd lyp=<scl_c1d.lyp> -rd out=<file.png> [-rd cell=<name>]
#                   [-rd box=<x1,y1,x2,y2 in um>] [-rd w=<px>] [-rd h=<px>] -r flow/img_view.py
import pya

def opt(name, default):
    return globals()[name] if name in globals() else default

W, H = int(opt("w", 1800)), int(opt("h", 1800))
lv = pya.LayoutView()
lv.load_layout(gds, True)
lv.load_layer_props(lyp)
cv = lv.cellview(0)
if opt("cell", ""):
    cv.set_cell_name(cell)                     # show this cell as the top
lv.max_hier()
lv.set_config("grid-visible", "false")
lv.set_config("text-visible", "false")
lv.set_config("background-color", "#ffffff")
c = cv.cell
bb = c.dbbox()
if opt("box", ""):
    bb = pya.DBox(*[float(v) for v in box.split(",")])
else:
    m = max(bb.width(), bb.height()) * 0.03
    bb = bb.enlarged(m, m)
if opt("h", "") == "":                         # keep the aspect ratio of the view
    H = max(200, int(W * bb.height() / bb.width()))
lv.zoom_box(bb)
lv.save_image_with_options(out, W, H, 0, 2, 0, bb, False)
print("IMG_VIEW: %s -> %s (%dx%d)" % (c.name, out, W, H))
