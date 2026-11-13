#!/usr/bin/env python3
# make_libtest.py - Library qualification block: N instances of every cell type the design uses, every pin
# connected, small die. Routed with the real flow (flow/pnr_core.tcl), then DRC + open/short check + LVS.
# Usage: python3 flow/libtest/make_libtest.py <route.lef> <outdir> CELL,CELL,...
import re, sys
lef, out, cells = sys.argv[1], sys.argv[2], sys.argv[3].split(",")
txt = open(lef).read()
pins = {}
for c in cells:
    body = re.search(r"\n(?:MACRO|macro) %s\b(.*?)\nEND %s" % (c, c), txt, re.S).group(1)
    pins[c] = [(m.group(1), m.group(2)) for m in re.finditer(r"\n\s*PIN (\S+)\s*\n\s*DIRECTION (\w+)", body)
               if m.group(1) not in ("VDD", "VSS")]
N_IN = 6
pool = ["in%d" % i for i in range(N_IN)]
wires, insts, k = [], [], 0
for rep in range(4):
    for c in cells:
        n = 2 if c != "DFCL11" else 3
        for _ in range(n):
            name = "u%d" % len(insts); conn = []
            for p, d in pins[c]:
                if d == "INPUT":
                    if c == "DFCL11" and p == "C": net = "clk"
                    elif c == "DFCL11" and p == "CLRB": net = "rst_n"
                    else: net = pool[k % len(pool)]; k += 3
                    conn.append(".%s(%s)" % (p, net))
                else:
                    net = "n%d" % len(wires); wires.append(net); conn.append(".%s(%s)" % (p, net))
                    pool.append(net)
            insts.append("  %s %s (%s);" % (c, name, ", ".join(conn)))
outs = [w for w in wires][-8:]                       # Last 8 driven nets become the output ports (no assigns)
ren = {w: "out%d" % i for i, w in enumerate(outs)}
insts = [re.sub(r"\((n\d+)\)", lambda m: "(%s)" % ren.get(m.group(1), m.group(1)), l) for l in insts]
wires = [w for w in wires if w not in ren]
with open(out + "/libtest.v", "w") as f:
    f.write("module libtest (clk, rst_n, %s, %s);\n" % (", ".join("in%d" % i for i in range(N_IN)), ", ".join("out%d" % i for i in range(8))))
    f.write("  input clk, rst_n, %s;\n  output %s;\n" % (", ".join("in%d" % i for i in range(N_IN)), ", ".join("out%d" % i for i in range(8))))
    f.write("".join("  wire %s;\n" % w for w in wires))
    f.write("\n".join(insts) + "\n")
    f.write("endmodule\n")
with open(out + "/libtest.sdc", "w") as f:
    f.write("create_clock -name CLK -period 100 [get_ports clk]\nset_input_delay 10 -clock CLK [get_ports in*]\n"
            "set_output_delay 10 -clock CLK [get_ports out*]\nset_false_path -from [get_ports rst_n]\nset_load 1.0 [all_outputs]\n")
ports = ["clk", "rst_n"] + ["in%d" % i for i in range(N_IN)] + ["out%d" % i for i in range(8)]
with open(out + "/pins.tcl", "w") as f:
    for i, p in enumerate(ports):
        x = 120 + i * 29.4
        f.write("place_pin -pin_name {%s} -layer metal2 -location {%.3f 0.000} -pin_size {3 6} -force_to_die_boundary\n" % (p, x))
print("LIBTEST: %d instances of %d cell types, %d nets -> %s" % (len(insts), len(cells), len(wires), out))
