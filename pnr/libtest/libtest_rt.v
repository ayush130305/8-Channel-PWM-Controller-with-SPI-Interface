module libtest (clk,
    in0,
    in1,
    in2,
    in3,
    in4,
    in5,
    out0,
    out1,
    out2,
    out3,
    out4,
    out5,
    out6,
    out7,
    rst_n);
 input clk;
 input in0;
 input in1;
 input in2;
 input in3;
 input in4;
 input in5;
 output out0;
 output out1;
 output out2;
 output out3;
 output out4;
 output out5;
 output out6;
 output out7;
 input rst_n;

 wire n0;
 wire n1;
 wire n10;
 wire n100;
 wire n101;
 wire n102;
 wire n103;
 wire n104;
 wire n105;
 wire n106;
 wire n107;
 wire n108;
 wire n109;
 wire n11;
 wire n110;
 wire n111;
 wire n112;
 wire n113;
 wire n114;
 wire n115;
 wire n116;
 wire n117;
 wire n118;
 wire n119;
 wire n12;
 wire n120;
 wire n121;
 wire n122;
 wire n123;
 wire n124;
 wire n125;
 wire n126;
 wire n127;
 wire n128;
 wire n129;
 wire n13;
 wire n130;
 wire n131;
 wire n132;
 wire n133;
 wire n134;
 wire n135;
 wire n136;
 wire n137;
 wire n138;
 wire n139;
 wire n14;
 wire n140;
 wire n141;
 wire n142;
 wire n143;
 wire n144;
 wire n145;
 wire n146;
 wire n147;
 wire n148;
 wire n149;
 wire n15;
 wire n150;
 wire n151;
 wire n152;
 wire n153;
 wire n154;
 wire n155;
 wire n156;
 wire n157;
 wire n158;
 wire n159;
 wire n16;
 wire n160;
 wire n161;
 wire n162;
 wire n163;
 wire n164;
 wire n165;
 wire n166;
 wire n167;
 wire n168;
 wire n169;
 wire n17;
 wire n170;
 wire n171;
 wire n172;
 wire n173;
 wire n174;
 wire n175;
 wire n176;
 wire n177;
 wire n178;
 wire n179;
 wire n18;
 wire n180;
 wire n181;
 wire n182;
 wire n183;
 wire n19;
 wire n2;
 wire n20;
 wire n21;
 wire n22;
 wire n23;
 wire n24;
 wire n25;
 wire n26;
 wire n27;
 wire n28;
 wire n29;
 wire n3;
 wire n30;
 wire n31;
 wire n32;
 wire n33;
 wire n34;
 wire n35;
 wire n36;
 wire n37;
 wire n38;
 wire n39;
 wire n4;
 wire n40;
 wire n41;
 wire n42;
 wire n43;
 wire n44;
 wire n45;
 wire n46;
 wire n47;
 wire n48;
 wire n49;
 wire n5;
 wire n50;
 wire n51;
 wire n52;
 wire n53;
 wire n54;
 wire n55;
 wire n56;
 wire n57;
 wire n58;
 wire n59;
 wire n6;
 wire n60;
 wire n61;
 wire n62;
 wire n63;
 wire n64;
 wire n65;
 wire n66;
 wire n67;
 wire n68;
 wire n69;
 wire n7;
 wire n70;
 wire n71;
 wire n72;
 wire n73;
 wire n74;
 wire n75;
 wire n76;
 wire n77;
 wire n78;
 wire n79;
 wire n8;
 wire n80;
 wire n81;
 wire n82;
 wire n83;
 wire n84;
 wire n85;
 wire n86;
 wire n87;
 wire n88;
 wire n89;
 wire n9;
 wire n90;
 wire n91;
 wire n92;
 wire n93;
 wire n94;
 wire n95;
 wire n96;
 wire n97;
 wire n98;
 wire n99;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;

 ADNR01 u0 (.A(in0),
    .B(in3),
    .C(in0),
    .OUT1(n0));
 ADNR01 u1 (.A(in2),
    .B(in5),
    .C(in1),
    .OUT1(n1));
 DFCL11 u10 (.Q(n12),
    .C(clknet_1_0__leaf_clk),
    .D(in2),
    .QB(n13),
    .CLRB(rst_n));
 DFCL11 u100 (.Q(n108),
    .C(clknet_1_1__leaf_clk),
    .D(n91),
    .QB(n109),
    .CLRB(rst_n));
 INVR01 u101 (.OUT1(n110),
    .IN1(n84));
 INVR01 u102 (.OUT1(n111),
    .IN1(n82));
 INVR05 u103 (.OUT1(n112),
    .IN1(n80));
 INVR05 u104 (.OUT1(n113),
    .IN1(n78));
 MX2101 u105 (.D0(n81),
    .OUT1(n114),
    .A0(n79),
    .D1(n82));
 MX2101 u106 (.D0(n85),
    .OUT1(n115),
    .A0(n83),
    .D1(n86));
 NND201 u107 (.OUT1(n116),
    .IN1(n84),
    .IN2(n87));
 NND201 u108 (.OUT1(n117),
    .IN1(n85),
    .IN2(n88));
 NND601 u109 (.OUT1(n118),
    .IN1(n86),
    .IN2(n89),
    .IN3(n92),
    .IN4(n95),
    .IN5(n98),
    .IN6(n101));
 INVR01 u11 (.OUT1(n14),
    .IN1(n12));
 NND601 u110 (.OUT1(n119),
    .IN1(n99),
    .IN2(n102),
    .IN3(n105),
    .IN4(n108),
    .IN5(n111),
    .IN6(n114));
 NOR200 u111 (.OUT1(n120),
    .IN1(n112),
    .IN2(n115));
 NOR200 u112 (.OUT1(n121),
    .IN1(n113),
    .IN2(n116));
 NOR300 u113 (.OUT1(n122),
    .IN1(n114),
    .IN2(n117),
    .IN3(n120));
 NOR300 u114 (.OUT1(n123),
    .IN1(n118),
    .IN2(n121),
    .IN3(in0));
 NOR501 u115 (.OUT1(n124),
    .IN1(n122),
    .IN2(in0),
    .IN3(in3),
    .IN4(n0),
    .IN5(n3));
 NOR501 u116 (.OUT1(n125),
    .IN1(n0),
    .IN2(n3),
    .IN3(n6),
    .IN4(n9),
    .IN5(n12));
 OR2101 u117 (.OUT1(n126),
    .IN1(n9),
    .IN2(n12));
 OR2101 u118 (.OUT1(n127),
    .IN1(n9),
    .IN2(n12));
 ORND01 u119 (.A(n15),
    .B(n18),
    .C(n21),
    .OUT1(n128));
 INVR01 u12 (.OUT1(n15),
    .IN1(n12));
 ORND01 u120 (.A(n18),
    .B(n21),
    .C(n24),
    .OUT1(n129));
 VDDCON u121 (.TIEHI(n130));
 VDDCON u122 (.TIEHI(n131));
 XNR201 u123 (.OUT1(n132),
    .IN1(n3),
    .IN2(n6));
 XNR201 u124 (.OUT1(n133),
    .IN1(n3),
    .IN2(n6));
 XOR201 u125 (.OUT1(n134),
    .IN1(n3),
    .IN2(n6));
 XOR201 u126 (.OUT1(n135),
    .IN1(n3),
    .IN2(n6));
 CDRI01 u127 (.Q(n136),
    .IN1(n3));
 CDRI01 u128 (.Q(n137),
    .IN1(n0));
 INVR02 u129 (.OUT1(n138),
    .IN1(in3));
 INVR05 u13 (.OUT1(n16),
    .IN1(n12));
 INVR02 u130 (.OUT1(n139),
    .IN1(in0));
 INVR04 u131 (.OUT1(n140),
    .IN1(n138));
 INVR04 u132 (.OUT1(n141),
    .IN1(n136));
 INVR06 u133 (.OUT1(n142),
    .IN1(n134));
 INVR06 u134 (.OUT1(n143),
    .IN1(n132));
 ADNR01 u135 (.A(n135),
    .B(n138),
    .C(n141),
    .OUT1(n144));
 ADNR01 u136 (.A(n139),
    .B(n142),
    .C(in0),
    .OUT1(n145));
 AND201 u137 (.OUT1(n146),
    .IN1(n138),
    .IN2(n141));
 AND201 u138 (.OUT1(n147),
    .IN1(n139),
    .IN2(n142));
 AND301 u139 (.OUT1(n148),
    .IN1(n140),
    .IN2(n143),
    .IN3(n146));
 INVR05 u14 (.OUT1(n17),
    .IN1(n12));
 AND301 u140 (.OUT1(n149),
    .IN1(n144),
    .IN2(n147),
    .IN3(in0));
 AOI401 u141 (.A(in3),
    .B(n0),
    .C(n3),
    .D(n6),
    .OUT1(n150));
 AOI401 u142 (.A(n3),
    .B(n6),
    .C(n9),
    .D(n12),
    .OUT1(n151));
 DFCL11 u143 (.Q(n152),
    .C(clknet_1_0__leaf_clk),
    .D(n3),
    .QB(n153),
    .CLRB(rst_n));
 DFCL11 u144 (.Q(n154),
    .C(clknet_1_0__leaf_clk),
    .D(in0),
    .QB(n155),
    .CLRB(rst_n));
 DFCL11 u145 (.Q(n156),
    .C(clknet_1_0__leaf_clk),
    .D(n148),
    .QB(n157),
    .CLRB(rst_n));
 INVR01 u146 (.OUT1(n158),
    .IN1(n141));
 INVR01 u147 (.OUT1(n159),
    .IN1(n139));
 INVR05 u148 (.OUT1(n160),
    .IN1(n137));
 INVR05 u149 (.OUT1(n161),
    .IN1(n135));
 MX2101 u15 (.D0(n15),
    .OUT1(n18),
    .A0(n15),
    .D1(n18));
 MX2101 u150 (.D0(n138),
    .OUT1(n162),
    .A0(n136),
    .D1(n139));
 MX2101 u151 (.D0(n142),
    .OUT1(n163),
    .A0(n140),
    .D1(n143));
 NND201 u152 (.OUT1(n164),
    .IN1(n141),
    .IN2(n144));
 NND201 u153 (.OUT1(n165),
    .IN1(n142),
    .IN2(n145));
 NND601 u154 (.OUT1(n166),
    .IN1(n143),
    .IN2(n146),
    .IN3(n149),
    .IN4(n152),
    .IN5(n155),
    .IN6(n158));
 NND601 u155 (.OUT1(n167),
    .IN1(n156),
    .IN2(n159),
    .IN3(n162),
    .IN4(n165),
    .IN5(in0),
    .IN6(in3));
 NOR200 u156 (.OUT1(n168),
    .IN1(in0),
    .IN2(in3));
 NOR200 u157 (.OUT1(n169),
    .IN1(in0),
    .IN2(in3));
 NOR300 u158 (.OUT1(n170),
    .IN1(in0),
    .IN2(in3),
    .IN3(n0));
 NOR300 u159 (.OUT1(n171),
    .IN1(in3),
    .IN2(n0),
    .IN3(n3));
 MX2101 u16 (.D0(in2),
    .OUT1(n19),
    .A0(in1),
    .D1(in4));
 NOR501 u160 (.OUT1(n172),
    .IN1(n0),
    .IN2(n3),
    .IN3(n6),
    .IN4(n9),
    .IN5(n12));
 NOR501 u161 (.OUT1(n173),
    .IN1(n9),
    .IN2(n12),
    .IN3(n15),
    .IN4(n18),
    .IN5(n21));
 OR2101 u162 (.OUT1(n174),
    .IN1(n18),
    .IN2(n21));
 OR2101 u163 (.OUT1(n175),
    .IN1(n18),
    .IN2(n21));
 ORND01 u164 (.A(n24),
    .B(n27),
    .C(n30),
    .OUT1(n176));
 ORND01 u165 (.A(n27),
    .B(n30),
    .C(n33),
    .OUT1(n177));
 VDDCON u166 (.TIEHI(n178));
 VDDCON u167 (.TIEHI(n179));
 XNR201 u168 (.OUT1(n180),
    .IN1(n12),
    .IN2(n15));
 XNR201 u169 (.OUT1(n181),
    .IN1(n12),
    .IN2(n15));
 NND201 u17 (.OUT1(n20),
    .IN1(in3),
    .IN2(n0));
 XOR201 u170 (.OUT1(n182),
    .IN1(n12),
    .IN2(n15));
 XOR201 u171 (.OUT1(n183),
    .IN1(n12),
    .IN2(n15));
 CDRI01 u172 (.Q(out0),
    .IN1(n12));
 CDRI01 u173 (.Q(out1),
    .IN1(n9));
 INVR02 u174 (.OUT1(out2),
    .IN1(n6));
 INVR02 u175 (.OUT1(out3),
    .IN1(n3));
 INVR04 u176 (.OUT1(out4),
    .IN1(n0));
 INVR04 u177 (.OUT1(out5),
    .IN1(in3));
 INVR06 u178 (.OUT1(out6),
    .IN1(in0));
 INVR06 u179 (.OUT1(out7),
    .IN1(out5));
 NND201 u18 (.OUT1(n21),
    .IN1(in5),
    .IN2(n2));
 NND601 u19 (.OUT1(n22),
    .IN1(n1),
    .IN2(n4),
    .IN3(n7),
    .IN4(n10),
    .IN5(n13),
    .IN6(n16));
 AND201 u2 (.OUT1(n2),
    .IN1(in0),
    .IN2(in3));
 NND601 u20 (.OUT1(n23),
    .IN1(n15),
    .IN2(n18),
    .IN3(n21),
    .IN4(in0),
    .IN5(in3),
    .IN6(n0));
 NOR200 u21 (.OUT1(n24),
    .IN1(in4),
    .IN2(n1));
 NOR200 u22 (.OUT1(n25),
    .IN1(in5),
    .IN2(n2));
 NOR300 u23 (.OUT1(n26),
    .IN1(n0),
    .IN2(n3),
    .IN3(n6));
 NOR300 u24 (.OUT1(n27),
    .IN1(n4),
    .IN2(n7),
    .IN3(n10));
 NOR501 u25 (.OUT1(n28),
    .IN1(n8),
    .IN2(n11),
    .IN3(n14),
    .IN4(n17),
    .IN5(n20));
 NOR501 u26 (.OUT1(n29),
    .IN1(n18),
    .IN2(n21),
    .IN3(n24),
    .IN4(n27),
    .IN5(in0));
 OR2101 u27 (.OUT1(n30),
    .IN1(n28),
    .IN2(in0));
 OR2101 u28 (.OUT1(n31),
    .IN1(n29),
    .IN2(in0));
 ORND01 u29 (.A(in3),
    .B(n0),
    .C(n3),
    .OUT1(n32));
 AND201 u3 (.OUT1(n3),
    .IN1(in4),
    .IN2(n1));
 ORND01 u30 (.A(n0),
    .B(n3),
    .C(n6),
    .OUT1(n33));
 VDDCON u31 (.TIEHI(n34));
 VDDCON u32 (.TIEHI(n35));
 XNR201 u33 (.OUT1(n36),
    .IN1(n28),
    .IN2(n31));
 XNR201 u34 (.OUT1(n37),
    .IN1(n29),
    .IN2(n32));
 XOR201 u35 (.OUT1(n38),
    .IN1(n30),
    .IN2(n33));
 XOR201 u36 (.OUT1(n39),
    .IN1(n31),
    .IN2(n34));
 CDRI01 u37 (.Q(n40),
    .IN1(n32));
 CDRI01 u38 (.Q(n41),
    .IN1(n30));
 INVR02 u39 (.OUT1(n42),
    .IN1(n28));
 AND301 u4 (.OUT1(n4),
    .IN1(n2),
    .IN2(in0),
    .IN3(in3));
 INVR02 u40 (.OUT1(n43),
    .IN1(n26));
 INVR04 u41 (.OUT1(n44),
    .IN1(n24));
 INVR04 u42 (.OUT1(n45),
    .IN1(n22));
 INVR06 u43 (.OUT1(n46),
    .IN1(n20));
 INVR06 u44 (.OUT1(n47),
    .IN1(n18));
 ADNR01 u45 (.A(n21),
    .B(n24),
    .C(n27),
    .OUT1(n48));
 ADNR01 u46 (.A(n25),
    .B(n28),
    .C(n31),
    .OUT1(n49));
 AND201 u47 (.OUT1(n50),
    .IN1(n24),
    .IN2(n27));
 AND201 u48 (.OUT1(n51),
    .IN1(n25),
    .IN2(n28));
 AND301 u49 (.OUT1(n52),
    .IN1(n26),
    .IN2(n29),
    .IN3(n32));
 AND301 u5 (.OUT1(n5),
    .IN1(in3),
    .IN2(n0),
    .IN3(n3));
 AND301 u50 (.OUT1(n53),
    .IN1(n30),
    .IN2(n33),
    .IN3(n36));
 AOI401 u51 (.A(n39),
    .B(n42),
    .C(n45),
    .D(n48),
    .OUT1(n54));
 AOI401 u52 (.A(n46),
    .B(n49),
    .C(n52),
    .D(in0),
    .OUT1(n55));
 DFCL11 u53 (.Q(n56),
    .C(clknet_1_1__leaf_clk),
    .D(n48),
    .QB(n57),
    .CLRB(rst_n));
 DFCL11 u54 (.Q(n58),
    .C(clknet_1_1__leaf_clk),
    .D(n41),
    .QB(n59),
    .CLRB(rst_n));
 DFCL11 u55 (.Q(n60),
    .C(clknet_1_1__leaf_clk),
    .D(n34),
    .QB(n61),
    .CLRB(rst_n));
 INVR01 u56 (.OUT1(n62),
    .IN1(n27));
 INVR01 u57 (.OUT1(n63),
    .IN1(n25));
 INVR05 u58 (.OUT1(n64),
    .IN1(n23));
 INVR05 u59 (.OUT1(n65),
    .IN1(n21));
 AOI401 u6 (.A(in0),
    .B(in3),
    .C(n0),
    .D(n3),
    .OUT1(n6));
 MX2101 u60 (.D0(n24),
    .OUT1(n66),
    .A0(n22),
    .D1(n25));
 MX2101 u61 (.D0(n28),
    .OUT1(n67),
    .A0(n26),
    .D1(n29));
 NND201 u62 (.OUT1(n68),
    .IN1(n27),
    .IN2(n30));
 NND201 u63 (.OUT1(n69),
    .IN1(n28),
    .IN2(n31));
 NND601 u64 (.OUT1(n70),
    .IN1(n29),
    .IN2(n32),
    .IN3(n35),
    .IN4(n38),
    .IN5(n41),
    .IN6(n44));
 NND601 u65 (.OUT1(n71),
    .IN1(n42),
    .IN2(n45),
    .IN3(n48),
    .IN4(n51),
    .IN5(n54),
    .IN6(n57));
 NOR200 u66 (.OUT1(n72),
    .IN1(n55),
    .IN2(n58));
 NOR200 u67 (.OUT1(n73),
    .IN1(n56),
    .IN2(n59));
 NOR300 u68 (.OUT1(n74),
    .IN1(n57),
    .IN2(n60),
    .IN3(n63));
 NOR300 u69 (.OUT1(n75),
    .IN1(n61),
    .IN2(n64),
    .IN3(n67));
 AOI401 u7 (.A(n2),
    .B(n5),
    .C(in1),
    .D(in4),
    .OUT1(n7));
 NOR501 u70 (.OUT1(n76),
    .IN1(n65),
    .IN2(n68),
    .IN3(n71),
    .IN4(n74),
    .IN5(in0));
 NOR501 u71 (.OUT1(n77),
    .IN1(n75),
    .IN2(in0),
    .IN3(in3),
    .IN4(n0),
    .IN5(n3));
 OR2101 u72 (.OUT1(n78),
    .IN1(n0),
    .IN2(n3));
 OR2101 u73 (.OUT1(n79),
    .IN1(n0),
    .IN2(n3));
 ORND01 u74 (.A(n6),
    .B(n9),
    .C(n12),
    .OUT1(n80));
 ORND01 u75 (.A(n9),
    .B(n12),
    .C(n15),
    .OUT1(n81));
 VDDCON u76 (.TIEHI(n82));
 VDDCON u77 (.TIEHI(n83));
 XNR201 u78 (.OUT1(n84),
    .IN1(in0),
    .IN2(in3));
 XNR201 u79 (.OUT1(n85),
    .IN1(in0),
    .IN2(in3));
 DFCL11 u8 (.Q(n8),
    .C(clknet_1_0__leaf_clk),
    .D(n6),
    .QB(n9),
    .CLRB(rst_n));
 XOR201 u80 (.OUT1(n86),
    .IN1(in0),
    .IN2(in3));
 XOR201 u81 (.OUT1(n87),
    .IN1(in0),
    .IN2(in3));
 CDRI01 u82 (.Q(n88),
    .IN1(in0));
 CDRI01 u83 (.Q(n89),
    .IN1(n87));
 INVR02 u84 (.OUT1(n90),
    .IN1(n85));
 INVR02 u85 (.OUT1(n91),
    .IN1(n83));
 INVR04 u86 (.OUT1(n92),
    .IN1(n81));
 INVR04 u87 (.OUT1(n93),
    .IN1(n79));
 INVR06 u88 (.OUT1(n94),
    .IN1(n77));
 INVR06 u89 (.OUT1(n95),
    .IN1(n75));
 DFCL11 u9 (.Q(n10),
    .C(clknet_1_0__leaf_clk),
    .D(n1),
    .QB(n11),
    .CLRB(rst_n));
 ADNR01 u90 (.A(n78),
    .B(n81),
    .C(n84),
    .OUT1(n96));
 ADNR01 u91 (.A(n82),
    .B(n85),
    .C(n88),
    .OUT1(n97));
 AND201 u92 (.OUT1(n98),
    .IN1(n81),
    .IN2(n84));
 AND201 u93 (.OUT1(n99),
    .IN1(n82),
    .IN2(n85));
 AND301 u94 (.OUT1(n100),
    .IN1(n83),
    .IN2(n86),
    .IN3(n89));
 AND301 u95 (.OUT1(n101),
    .IN1(n87),
    .IN2(n90),
    .IN3(n93));
 AOI401 u96 (.A(n96),
    .B(n99),
    .C(in0),
    .D(in3),
    .OUT1(n102));
 AOI401 u97 (.A(in0),
    .B(in3),
    .C(n0),
    .D(n3),
    .OUT1(n103));
 DFCL11 u98 (.Q(n104),
    .C(clknet_1_0__leaf_clk),
    .D(in0),
    .QB(n105),
    .CLRB(rst_n));
 DFCL11 u99 (.Q(n106),
    .C(clknet_1_1__leaf_clk),
    .D(n98),
    .QB(n107),
    .CLRB(rst_n));
 CDRI01 clkbuf_0_clk (.Q(clknet_0_clk),
    .IN1(clk));
 CDRI01 clkbuf_1_0__f_clk (.Q(clknet_1_0__leaf_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_1_1__f_clk (.Q(clknet_1_1__leaf_clk),
    .IN1(clknet_0_clk));
endmodule
