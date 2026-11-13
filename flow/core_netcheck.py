# core_netcheck.py - Geometric open/short check of a routed core GDS against its DEF nets (metal1/via1/metal2).
# Usage: klayout -b -rd deff=<4_route.def> -rd gds=<core.gds> -r flow/core_netcheck.py   (prints OPENS / SHORTS)
import pya, re
t=open(deff).read(); s=t[t.index("\nNETS "):t.index("END NETS")]
ly=pya.Layout(); ly.read(gds); top=ly.top_cells()[0]
l2n=pya.LayoutToNetlist(pya.RecursiveShapeIterator(ly,top,[]))
m1=l2n.make_layer(ly.layer(8,0),"m1"); v1=l2n.make_layer(ly.layer(9,0),"v1"); m2=l2n.make_layer(ly.layer(10,0),"m2")
l2n.connect(m1); l2n.connect(v1); l2n.connect(m2); l2n.connect(m1,v1); l2n.connect(v1,m2)
l2n.extract_netlist()
owner={}; opens=[]
for m in re.finditer(r"\n\s+- (\S+) (.*?);(?=\n)",s,re.S):
    name, body = m.group(1), m.group(2)
    ids=set()
    for lay,x1,y1,x2,y2 in re.findall(r"(metal[12]) \( (\d+) (\d+) \) \( (\S+) (\S+) \)", body):
        x2 = x1 if x2=="*" else x2; y2 = y1 if y2=="*" else y2
        x=(int(x1)+int(x2))/2000; y=(int(y1)+int(y2))/2000
        n=l2n.probe_net(m1 if lay=="metal1" else m2, pya.DPoint(x,y))
        if n is None: continue
        ids.add(n.cluster_id)
    if len(ids)>1: opens.append((name,len(ids)))
    for i in ids: owner.setdefault(i,set()).add(name)
# Nets driven by VDDCON TIEHI / VSSCON TIELO are VDD / VSS metal by design: not shorts among themselves
tie=set()
nl=t[t.index("\nNETS "):t.index("END NETS")]
for mm in re.finditer(r"\n\s+- (\S+) (.*?);(?=\n)", nl, re.S):
    if re.search(r"\( \S+ (TIEHI|TIELO) \)", mm.group(2).split("+")[0]): tie.add(mm.group(1))
shorts=[sorted(v) for v in owner.values() if len(v - tie)>1]
print("OPENS", len(opens), opens[:10]); print("SHORTS", len(shorts)); [print("  ", len(x), x[:12]) for x in shorts[:15]]
