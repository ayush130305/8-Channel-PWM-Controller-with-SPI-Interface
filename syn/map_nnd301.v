// map_nnd301.v - techmap for yosys: NND301 (3-input NAND, fails the routing-LEF audit: pin IN1 has no DRC-legal
// via site) -> AND301 + INVR01, both of which pass. ABC keeps NND301 in its library only to avoid an internal
// assertion (no 3-input NAND left); this rewrites any it chose.
(* techmap_celltype = "NND301" *)
module _nnd301_ (input IN1, input IN2, input IN3, output OUT1);
  wire a;
  AND301 _and_ (.IN1(IN1), .IN2(IN2), .IN3(IN3), .OUT1(a));
  INVR01 _inv_ (.IN1(a), .OUT1(OUT1));
endmodule
