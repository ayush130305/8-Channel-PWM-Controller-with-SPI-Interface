#!/usr/bin/env python3
# filter_lib.py - Copy a liberty file without the cells listed in a dont-use file (one name per line, # comments).
# Used for ABC instead of -dont_use (yosys-abc asserts in Mio_AreaCompare2 with this cell set).
import re, sys
src, du, out = sys.argv[1:4]
ban = {l.strip() for l in open(du) if l.strip() and not l.startswith("#")}
t = open(src).read(); o = []; i = 0; n = 0
for m in re.finditer(r"\n\s*cell\s*\(\s*\"?(\w+)\"?\s*\)\s*\{", t):
    if m.group(1) not in ban or m.start() < i: continue
    depth, j = 0, m.end() - 1
    while True:
        ch = t[j]
        if ch == "{": depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0: break
        j += 1
    o.append(t[i:m.start()]); i = j + 1; n += 1
o.append(t[i:])
open(out, "w").write("".join(o))
print("FILTER_LIB: removed %d cells -> %s" % (n, out))
