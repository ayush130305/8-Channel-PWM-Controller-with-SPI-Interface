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
    .OUT1(n0),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 u1 (.A(in2),
    .B(in5),
    .C(in1),
    .OUT1(n1),
    .VSS(VSS),
    .VDD(VDD));
 DFCL11 u10 (.Q(n12),
    .C(clknet_1_0__leaf_clk),
    .D(in2),
    .QB(n13),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 u100 (.Q(n108),
    .C(clknet_1_1__leaf_clk),
    .D(n91),
    .QB(n109),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 INVR01 u101 (.OUT1(n110),
    .VSS(VSS),
    .IN1(n84),
    .VDD(VDD));
 INVR01 u102 (.OUT1(n111),
    .VSS(VSS),
    .IN1(n82),
    .VDD(VDD));
 INVR05 u103 (.OUT1(n112),
    .VSS(VSS),
    .IN1(n80),
    .VDD(VDD));
 INVR05 u104 (.OUT1(n113),
    .VSS(VSS),
    .IN1(n78),
    .VDD(VDD));
 MX2101 u105 (.D0(n81),
    .OUT1(n114),
    .A0(n79),
    .D1(n82),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 u106 (.D0(n85),
    .OUT1(n115),
    .A0(n83),
    .D1(n86),
    .VSS(VSS),
    .VDD(VDD));
 NND201 u107 (.OUT1(n116),
    .VSS(VSS),
    .IN1(n84),
    .IN2(n87),
    .VDD(VDD));
 NND201 u108 (.OUT1(n117),
    .VSS(VSS),
    .IN1(n85),
    .IN2(n88),
    .VDD(VDD));
 NND601 u109 (.OUT1(n118),
    .VSS(VSS),
    .IN1(n86),
    .IN2(n89),
    .IN3(n92),
    .IN4(n95),
    .IN5(n98),
    .IN6(n101),
    .VDD(VDD));
 INVR01 u11 (.OUT1(n14),
    .VSS(VSS),
    .IN1(n12),
    .VDD(VDD));
 NND601 u110 (.OUT1(n119),
    .VSS(VSS),
    .IN1(n99),
    .IN2(n102),
    .IN3(n105),
    .IN4(n108),
    .IN5(n111),
    .IN6(n114),
    .VDD(VDD));
 NOR200 u111 (.OUT1(n120),
    .VSS(VSS),
    .IN1(n112),
    .IN2(n115),
    .VDD(VDD));
 NOR200 u112 (.OUT1(n121),
    .VSS(VSS),
    .IN1(n113),
    .IN2(n116),
    .VDD(VDD));
 NOR300 u113 (.OUT1(n122),
    .VSS(VSS),
    .IN1(n114),
    .IN2(n117),
    .IN3(n120),
    .VDD(VDD));
 NOR300 u114 (.OUT1(n123),
    .VSS(VSS),
    .IN1(n118),
    .IN2(n121),
    .IN3(in0),
    .VDD(VDD));
 NOR501 u115 (.OUT1(n124),
    .VSS(VSS),
    .IN1(n122),
    .IN2(in0),
    .IN3(in3),
    .IN4(n0),
    .IN5(n3),
    .VDD(VDD));
 NOR501 u116 (.OUT1(n125),
    .VSS(VSS),
    .IN1(n0),
    .IN2(n3),
    .IN3(n6),
    .IN4(n9),
    .IN5(n12),
    .VDD(VDD));
 OR2101 u117 (.OUT1(n126),
    .VSS(VSS),
    .IN1(n9),
    .IN2(n12),
    .VDD(VDD));
 OR2101 u118 (.OUT1(n127),
    .VSS(VSS),
    .IN1(n9),
    .IN2(n12),
    .VDD(VDD));
 ORND01 u119 (.A(n15),
    .B(n18),
    .C(n21),
    .OUT1(n128),
    .VSS(VSS),
    .VDD(VDD));
 INVR01 u12 (.OUT1(n15),
    .VSS(VSS),
    .IN1(n12),
    .VDD(VDD));
 ORND01 u120 (.A(n18),
    .B(n21),
    .C(n24),
    .OUT1(n129),
    .VSS(VSS),
    .VDD(VDD));
 VDDCON u121 (.VSS(VSS),
    .TIEHI(n130),
    .VDD(VDD));
 VDDCON u122 (.VSS(VSS),
    .TIEHI(n131),
    .VDD(VDD));
 XNR201 u123 (.OUT1(n132),
    .VSS(VSS),
    .IN1(n3),
    .IN2(n6),
    .VDD(VDD));
 XNR201 u124 (.OUT1(n133),
    .VSS(VSS),
    .IN1(n3),
    .IN2(n6),
    .VDD(VDD));
 XOR201 u125 (.OUT1(n134),
    .VSS(VSS),
    .IN1(n3),
    .IN2(n6),
    .VDD(VDD));
 XOR201 u126 (.OUT1(n135),
    .VSS(VSS),
    .IN1(n3),
    .IN2(n6),
    .VDD(VDD));
 CDRI01 u127 (.Q(n136),
    .VSS(VSS),
    .IN1(n3),
    .VDD(VDD));
 CDRI01 u128 (.Q(n137),
    .VSS(VSS),
    .IN1(n0),
    .VDD(VDD));
 INVR02 u129 (.OUT1(n138),
    .VSS(VSS),
    .IN1(in3),
    .VDD(VDD));
 INVR05 u13 (.OUT1(n16),
    .VSS(VSS),
    .IN1(n12),
    .VDD(VDD));
 INVR02 u130 (.OUT1(n139),
    .VSS(VSS),
    .IN1(in0),
    .VDD(VDD));
 INVR04 u131 (.OUT1(n140),
    .VSS(VSS),
    .IN1(n138),
    .VDD(VDD));
 INVR04 u132 (.OUT1(n141),
    .VSS(VSS),
    .IN1(n136),
    .VDD(VDD));
 INVR06 u133 (.OUT1(n142),
    .VSS(VSS),
    .IN1(n134),
    .VDD(VDD));
 INVR06 u134 (.OUT1(n143),
    .VSS(VSS),
    .IN1(n132),
    .VDD(VDD));
 ADNR01 u135 (.A(n135),
    .B(n138),
    .C(n141),
    .OUT1(n144),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 u136 (.A(n139),
    .B(n142),
    .C(in0),
    .OUT1(n145),
    .VSS(VSS),
    .VDD(VDD));
 AND201 u137 (.OUT1(n146),
    .VSS(VSS),
    .IN1(n138),
    .IN2(n141),
    .VDD(VDD));
 AND201 u138 (.OUT1(n147),
    .VSS(VSS),
    .IN1(n139),
    .IN2(n142),
    .VDD(VDD));
 AND301 u139 (.OUT1(n148),
    .VSS(VSS),
    .IN1(n140),
    .IN2(n143),
    .IN3(n146),
    .VDD(VDD));
 INVR05 u14 (.OUT1(n17),
    .VSS(VSS),
    .IN1(n12),
    .VDD(VDD));
 AND301 u140 (.OUT1(n149),
    .VSS(VSS),
    .IN1(n144),
    .IN2(n147),
    .IN3(in0),
    .VDD(VDD));
 AOI401 u141 (.A(in3),
    .B(n0),
    .C(n3),
    .D(n6),
    .OUT1(n150),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 u142 (.A(n3),
    .B(n6),
    .C(n9),
    .D(n12),
    .OUT1(n151),
    .VSS(VSS),
    .VDD(VDD));
 DFCL11 u143 (.Q(n152),
    .C(clknet_1_0__leaf_clk),
    .D(n3),
    .QB(n153),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 u144 (.Q(n154),
    .C(clknet_1_0__leaf_clk),
    .D(in0),
    .QB(n155),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 u145 (.Q(n156),
    .C(clknet_1_0__leaf_clk),
    .D(n148),
    .QB(n157),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 INVR01 u146 (.OUT1(n158),
    .VSS(VSS),
    .IN1(n141),
    .VDD(VDD));
 INVR01 u147 (.OUT1(n159),
    .VSS(VSS),
    .IN1(n139),
    .VDD(VDD));
 INVR05 u148 (.OUT1(n160),
    .VSS(VSS),
    .IN1(n137),
    .VDD(VDD));
 INVR05 u149 (.OUT1(n161),
    .VSS(VSS),
    .IN1(n135),
    .VDD(VDD));
 MX2101 u15 (.D0(n15),
    .OUT1(n18),
    .A0(n15),
    .D1(n18),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 u150 (.D0(n138),
    .OUT1(n162),
    .A0(n136),
    .D1(n139),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 u151 (.D0(n142),
    .OUT1(n163),
    .A0(n140),
    .D1(n143),
    .VSS(VSS),
    .VDD(VDD));
 NND201 u152 (.OUT1(n164),
    .VSS(VSS),
    .IN1(n141),
    .IN2(n144),
    .VDD(VDD));
 NND201 u153 (.OUT1(n165),
    .VSS(VSS),
    .IN1(n142),
    .IN2(n145),
    .VDD(VDD));
 NND601 u154 (.OUT1(n166),
    .VSS(VSS),
    .IN1(n143),
    .IN2(n146),
    .IN3(n149),
    .IN4(n152),
    .IN5(n155),
    .IN6(n158),
    .VDD(VDD));
 NND601 u155 (.OUT1(n167),
    .VSS(VSS),
    .IN1(n156),
    .IN2(n159),
    .IN3(n162),
    .IN4(n165),
    .IN5(in0),
    .IN6(in3),
    .VDD(VDD));
 NOR200 u156 (.OUT1(n168),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .VDD(VDD));
 NOR200 u157 (.OUT1(n169),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .VDD(VDD));
 NOR300 u158 (.OUT1(n170),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .IN3(n0),
    .VDD(VDD));
 NOR300 u159 (.OUT1(n171),
    .VSS(VSS),
    .IN1(in3),
    .IN2(n0),
    .IN3(n3),
    .VDD(VDD));
 MX2101 u16 (.D0(in2),
    .OUT1(n19),
    .A0(in1),
    .D1(in4),
    .VSS(VSS),
    .VDD(VDD));
 NOR501 u160 (.OUT1(n172),
    .VSS(VSS),
    .IN1(n0),
    .IN2(n3),
    .IN3(n6),
    .IN4(n9),
    .IN5(n12),
    .VDD(VDD));
 NOR501 u161 (.OUT1(n173),
    .VSS(VSS),
    .IN1(n9),
    .IN2(n12),
    .IN3(n15),
    .IN4(n18),
    .IN5(n21),
    .VDD(VDD));
 OR2101 u162 (.OUT1(n174),
    .VSS(VSS),
    .IN1(n18),
    .IN2(n21),
    .VDD(VDD));
 OR2101 u163 (.OUT1(n175),
    .VSS(VSS),
    .IN1(n18),
    .IN2(n21),
    .VDD(VDD));
 ORND01 u164 (.A(n24),
    .B(n27),
    .C(n30),
    .OUT1(n176),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 u165 (.A(n27),
    .B(n30),
    .C(n33),
    .OUT1(n177),
    .VSS(VSS),
    .VDD(VDD));
 VDDCON u166 (.VSS(VSS),
    .TIEHI(n178),
    .VDD(VDD));
 VDDCON u167 (.VSS(VSS),
    .TIEHI(n179),
    .VDD(VDD));
 XNR201 u168 (.OUT1(n180),
    .VSS(VSS),
    .IN1(n12),
    .IN2(n15),
    .VDD(VDD));
 XNR201 u169 (.OUT1(n181),
    .VSS(VSS),
    .IN1(n12),
    .IN2(n15),
    .VDD(VDD));
 NND201 u17 (.OUT1(n20),
    .VSS(VSS),
    .IN1(in3),
    .IN2(n0),
    .VDD(VDD));
 XOR201 u170 (.OUT1(n182),
    .VSS(VSS),
    .IN1(n12),
    .IN2(n15),
    .VDD(VDD));
 XOR201 u171 (.OUT1(n183),
    .VSS(VSS),
    .IN1(n12),
    .IN2(n15),
    .VDD(VDD));
 CDRI01 u172 (.Q(out0),
    .VSS(VSS),
    .IN1(n12),
    .VDD(VDD));
 CDRI01 u173 (.Q(out1),
    .VSS(VSS),
    .IN1(n9),
    .VDD(VDD));
 INVR02 u174 (.OUT1(out2),
    .VSS(VSS),
    .IN1(n6),
    .VDD(VDD));
 INVR02 u175 (.OUT1(out3),
    .VSS(VSS),
    .IN1(n3),
    .VDD(VDD));
 INVR04 u176 (.OUT1(out4),
    .VSS(VSS),
    .IN1(n0),
    .VDD(VDD));
 INVR04 u177 (.OUT1(out5),
    .VSS(VSS),
    .IN1(in3),
    .VDD(VDD));
 INVR06 u178 (.OUT1(out6),
    .VSS(VSS),
    .IN1(in0),
    .VDD(VDD));
 INVR06 u179 (.OUT1(out7),
    .VSS(VSS),
    .IN1(out5),
    .VDD(VDD));
 NND201 u18 (.OUT1(n21),
    .VSS(VSS),
    .IN1(in5),
    .IN2(n2),
    .VDD(VDD));
 NND601 u19 (.OUT1(n22),
    .VSS(VSS),
    .IN1(n1),
    .IN2(n4),
    .IN3(n7),
    .IN4(n10),
    .IN5(n13),
    .IN6(n16),
    .VDD(VDD));
 AND201 u2 (.OUT1(n2),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .VDD(VDD));
 NND601 u20 (.OUT1(n23),
    .VSS(VSS),
    .IN1(n15),
    .IN2(n18),
    .IN3(n21),
    .IN4(in0),
    .IN5(in3),
    .IN6(n0),
    .VDD(VDD));
 NOR200 u21 (.OUT1(n24),
    .VSS(VSS),
    .IN1(in4),
    .IN2(n1),
    .VDD(VDD));
 NOR200 u22 (.OUT1(n25),
    .VSS(VSS),
    .IN1(in5),
    .IN2(n2),
    .VDD(VDD));
 NOR300 u23 (.OUT1(n26),
    .VSS(VSS),
    .IN1(n0),
    .IN2(n3),
    .IN3(n6),
    .VDD(VDD));
 NOR300 u24 (.OUT1(n27),
    .VSS(VSS),
    .IN1(n4),
    .IN2(n7),
    .IN3(n10),
    .VDD(VDD));
 NOR501 u25 (.OUT1(n28),
    .VSS(VSS),
    .IN1(n8),
    .IN2(n11),
    .IN3(n14),
    .IN4(n17),
    .IN5(n20),
    .VDD(VDD));
 NOR501 u26 (.OUT1(n29),
    .VSS(VSS),
    .IN1(n18),
    .IN2(n21),
    .IN3(n24),
    .IN4(n27),
    .IN5(in0),
    .VDD(VDD));
 OR2101 u27 (.OUT1(n30),
    .VSS(VSS),
    .IN1(n28),
    .IN2(in0),
    .VDD(VDD));
 OR2101 u28 (.OUT1(n31),
    .VSS(VSS),
    .IN1(n29),
    .IN2(in0),
    .VDD(VDD));
 ORND01 u29 (.A(in3),
    .B(n0),
    .C(n3),
    .OUT1(n32),
    .VSS(VSS),
    .VDD(VDD));
 AND201 u3 (.OUT1(n3),
    .VSS(VSS),
    .IN1(in4),
    .IN2(n1),
    .VDD(VDD));
 ORND01 u30 (.A(n0),
    .B(n3),
    .C(n6),
    .OUT1(n33),
    .VSS(VSS),
    .VDD(VDD));
 VDDCON u31 (.VSS(VSS),
    .TIEHI(n34),
    .VDD(VDD));
 VDDCON u32 (.VSS(VSS),
    .TIEHI(n35),
    .VDD(VDD));
 XNR201 u33 (.OUT1(n36),
    .VSS(VSS),
    .IN1(n28),
    .IN2(n31),
    .VDD(VDD));
 XNR201 u34 (.OUT1(n37),
    .VSS(VSS),
    .IN1(n29),
    .IN2(n32),
    .VDD(VDD));
 XOR201 u35 (.OUT1(n38),
    .VSS(VSS),
    .IN1(n30),
    .IN2(n33),
    .VDD(VDD));
 XOR201 u36 (.OUT1(n39),
    .VSS(VSS),
    .IN1(n31),
    .IN2(n34),
    .VDD(VDD));
 CDRI01 u37 (.Q(n40),
    .VSS(VSS),
    .IN1(n32),
    .VDD(VDD));
 CDRI01 u38 (.Q(n41),
    .VSS(VSS),
    .IN1(n30),
    .VDD(VDD));
 INVR02 u39 (.OUT1(n42),
    .VSS(VSS),
    .IN1(n28),
    .VDD(VDD));
 AND301 u4 (.OUT1(n4),
    .VSS(VSS),
    .IN1(n2),
    .IN2(in0),
    .IN3(in3),
    .VDD(VDD));
 INVR02 u40 (.OUT1(n43),
    .VSS(VSS),
    .IN1(n26),
    .VDD(VDD));
 INVR04 u41 (.OUT1(n44),
    .VSS(VSS),
    .IN1(n24),
    .VDD(VDD));
 INVR04 u42 (.OUT1(n45),
    .VSS(VSS),
    .IN1(n22),
    .VDD(VDD));
 INVR06 u43 (.OUT1(n46),
    .VSS(VSS),
    .IN1(n20),
    .VDD(VDD));
 INVR06 u44 (.OUT1(n47),
    .VSS(VSS),
    .IN1(n18),
    .VDD(VDD));
 ADNR01 u45 (.A(n21),
    .B(n24),
    .C(n27),
    .OUT1(n48),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 u46 (.A(n25),
    .B(n28),
    .C(n31),
    .OUT1(n49),
    .VSS(VSS),
    .VDD(VDD));
 AND201 u47 (.OUT1(n50),
    .VSS(VSS),
    .IN1(n24),
    .IN2(n27),
    .VDD(VDD));
 AND201 u48 (.OUT1(n51),
    .VSS(VSS),
    .IN1(n25),
    .IN2(n28),
    .VDD(VDD));
 AND301 u49 (.OUT1(n52),
    .VSS(VSS),
    .IN1(n26),
    .IN2(n29),
    .IN3(n32),
    .VDD(VDD));
 AND301 u5 (.OUT1(n5),
    .VSS(VSS),
    .IN1(in3),
    .IN2(n0),
    .IN3(n3),
    .VDD(VDD));
 AND301 u50 (.OUT1(n53),
    .VSS(VSS),
    .IN1(n30),
    .IN2(n33),
    .IN3(n36),
    .VDD(VDD));
 AOI401 u51 (.A(n39),
    .B(n42),
    .C(n45),
    .D(n48),
    .OUT1(n54),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 u52 (.A(n46),
    .B(n49),
    .C(n52),
    .D(in0),
    .OUT1(n55),
    .VSS(VSS),
    .VDD(VDD));
 DFCL11 u53 (.Q(n56),
    .C(clknet_1_1__leaf_clk),
    .D(n48),
    .QB(n57),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 u54 (.Q(n58),
    .C(clknet_1_1__leaf_clk),
    .D(n41),
    .QB(n59),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 u55 (.Q(n60),
    .C(clknet_1_1__leaf_clk),
    .D(n34),
    .QB(n61),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 INVR01 u56 (.OUT1(n62),
    .VSS(VSS),
    .IN1(n27),
    .VDD(VDD));
 INVR01 u57 (.OUT1(n63),
    .VSS(VSS),
    .IN1(n25),
    .VDD(VDD));
 INVR05 u58 (.OUT1(n64),
    .VSS(VSS),
    .IN1(n23),
    .VDD(VDD));
 INVR05 u59 (.OUT1(n65),
    .VSS(VSS),
    .IN1(n21),
    .VDD(VDD));
 AOI401 u6 (.A(in0),
    .B(in3),
    .C(n0),
    .D(n3),
    .OUT1(n6),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 u60 (.D0(n24),
    .OUT1(n66),
    .A0(n22),
    .D1(n25),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 u61 (.D0(n28),
    .OUT1(n67),
    .A0(n26),
    .D1(n29),
    .VSS(VSS),
    .VDD(VDD));
 NND201 u62 (.OUT1(n68),
    .VSS(VSS),
    .IN1(n27),
    .IN2(n30),
    .VDD(VDD));
 NND201 u63 (.OUT1(n69),
    .VSS(VSS),
    .IN1(n28),
    .IN2(n31),
    .VDD(VDD));
 NND601 u64 (.OUT1(n70),
    .VSS(VSS),
    .IN1(n29),
    .IN2(n32),
    .IN3(n35),
    .IN4(n38),
    .IN5(n41),
    .IN6(n44),
    .VDD(VDD));
 NND601 u65 (.OUT1(n71),
    .VSS(VSS),
    .IN1(n42),
    .IN2(n45),
    .IN3(n48),
    .IN4(n51),
    .IN5(n54),
    .IN6(n57),
    .VDD(VDD));
 NOR200 u66 (.OUT1(n72),
    .VSS(VSS),
    .IN1(n55),
    .IN2(n58),
    .VDD(VDD));
 NOR200 u67 (.OUT1(n73),
    .VSS(VSS),
    .IN1(n56),
    .IN2(n59),
    .VDD(VDD));
 NOR300 u68 (.OUT1(n74),
    .VSS(VSS),
    .IN1(n57),
    .IN2(n60),
    .IN3(n63),
    .VDD(VDD));
 NOR300 u69 (.OUT1(n75),
    .VSS(VSS),
    .IN1(n61),
    .IN2(n64),
    .IN3(n67),
    .VDD(VDD));
 AOI401 u7 (.A(n2),
    .B(n5),
    .C(in1),
    .D(in4),
    .OUT1(n7),
    .VSS(VSS),
    .VDD(VDD));
 NOR501 u70 (.OUT1(n76),
    .VSS(VSS),
    .IN1(n65),
    .IN2(n68),
    .IN3(n71),
    .IN4(n74),
    .IN5(in0),
    .VDD(VDD));
 NOR501 u71 (.OUT1(n77),
    .VSS(VSS),
    .IN1(n75),
    .IN2(in0),
    .IN3(in3),
    .IN4(n0),
    .IN5(n3),
    .VDD(VDD));
 OR2101 u72 (.OUT1(n78),
    .VSS(VSS),
    .IN1(n0),
    .IN2(n3),
    .VDD(VDD));
 OR2101 u73 (.OUT1(n79),
    .VSS(VSS),
    .IN1(n0),
    .IN2(n3),
    .VDD(VDD));
 ORND01 u74 (.A(n6),
    .B(n9),
    .C(n12),
    .OUT1(n80),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 u75 (.A(n9),
    .B(n12),
    .C(n15),
    .OUT1(n81),
    .VSS(VSS),
    .VDD(VDD));
 VDDCON u76 (.VSS(VSS),
    .TIEHI(n82),
    .VDD(VDD));
 VDDCON u77 (.VSS(VSS),
    .TIEHI(n83),
    .VDD(VDD));
 XNR201 u78 (.OUT1(n84),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .VDD(VDD));
 XNR201 u79 (.OUT1(n85),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .VDD(VDD));
 DFCL11 u8 (.Q(n8),
    .C(clknet_1_0__leaf_clk),
    .D(n6),
    .QB(n9),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 XOR201 u80 (.OUT1(n86),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .VDD(VDD));
 XOR201 u81 (.OUT1(n87),
    .VSS(VSS),
    .IN1(in0),
    .IN2(in3),
    .VDD(VDD));
 CDRI01 u82 (.Q(n88),
    .VSS(VSS),
    .IN1(in0),
    .VDD(VDD));
 CDRI01 u83 (.Q(n89),
    .VSS(VSS),
    .IN1(n87),
    .VDD(VDD));
 INVR02 u84 (.OUT1(n90),
    .VSS(VSS),
    .IN1(n85),
    .VDD(VDD));
 INVR02 u85 (.OUT1(n91),
    .VSS(VSS),
    .IN1(n83),
    .VDD(VDD));
 INVR04 u86 (.OUT1(n92),
    .VSS(VSS),
    .IN1(n81),
    .VDD(VDD));
 INVR04 u87 (.OUT1(n93),
    .VSS(VSS),
    .IN1(n79),
    .VDD(VDD));
 INVR06 u88 (.OUT1(n94),
    .VSS(VSS),
    .IN1(n77),
    .VDD(VDD));
 INVR06 u89 (.OUT1(n95),
    .VSS(VSS),
    .IN1(n75),
    .VDD(VDD));
 DFCL11 u9 (.Q(n10),
    .C(clknet_1_0__leaf_clk),
    .D(n1),
    .QB(n11),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 ADNR01 u90 (.A(n78),
    .B(n81),
    .C(n84),
    .OUT1(n96),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 u91 (.A(n82),
    .B(n85),
    .C(n88),
    .OUT1(n97),
    .VSS(VSS),
    .VDD(VDD));
 AND201 u92 (.OUT1(n98),
    .VSS(VSS),
    .IN1(n81),
    .IN2(n84),
    .VDD(VDD));
 AND201 u93 (.OUT1(n99),
    .VSS(VSS),
    .IN1(n82),
    .IN2(n85),
    .VDD(VDD));
 AND301 u94 (.OUT1(n100),
    .VSS(VSS),
    .IN1(n83),
    .IN2(n86),
    .IN3(n89),
    .VDD(VDD));
 AND301 u95 (.OUT1(n101),
    .VSS(VSS),
    .IN1(n87),
    .IN2(n90),
    .IN3(n93),
    .VDD(VDD));
 AOI401 u96 (.A(n96),
    .B(n99),
    .C(in0),
    .D(in3),
    .OUT1(n102),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 u97 (.A(in0),
    .B(in3),
    .C(n0),
    .D(n3),
    .OUT1(n103),
    .VSS(VSS),
    .VDD(VDD));
 DFCL11 u98 (.Q(n104),
    .C(clknet_1_0__leaf_clk),
    .D(in0),
    .QB(n105),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 u99 (.Q(n106),
    .C(clknet_1_1__leaf_clk),
    .D(n98),
    .QB(n107),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 CDRI01 clkbuf_0_clk (.Q(clknet_0_clk),
    .IN1(clk));
 CDRI01 clkbuf_1_0__f_clk (.Q(clknet_1_0__leaf_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_1_1__f_clk (.Q(clknet_1_1__leaf_clk),
    .IN1(clknet_0_clk));
endmodule
