
module t0encdec ( ck, rst, A, B, C );
  input [7:0] A;
  output [8:0] B;
  output [7:0] C;
  input ck, rst;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, n21, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65;
  wire   [7:0] A_notcod;
  wire   [7:0] C_inc;
  wire   [7:2] add_55_carry;
  wire   [7:2] add_36_carry;

  DFFR_X1 A_notcod_reg_7_ ( .D(A[7]), .CK(ck), .RN(n49), .Q(A_notcod[7]) );
  DFFR_X1 A_notcod_reg_6_ ( .D(A[6]), .CK(ck), .RN(n49), .Q(A_notcod[6]) );
  DFFR_X1 A_notcod_reg_5_ ( .D(A[5]), .CK(ck), .RN(n49), .Q(A_notcod[5]) );
  DFFR_X1 A_notcod_reg_4_ ( .D(A[4]), .CK(ck), .RN(n49), .Q(A_notcod[4]) );
  DFFR_X1 A_notcod_reg_3_ ( .D(A[3]), .CK(ck), .RN(n49), .Q(A_notcod[3]) );
  DFFR_X1 A_notcod_reg_2_ ( .D(A[2]), .CK(ck), .RN(n49), .Q(A_notcod[2]) );
  DFFR_X1 A_notcod_reg_1_ ( .D(A[1]), .CK(ck), .RN(n49), .Q(A_notcod[1]) );
  DFFR_X1 A_notcod_reg_0_ ( .D(A[0]), .CK(ck), .RN(n49), .Q(A_notcod[0]) );
  DFFR_X1 inc_reg ( .D(N10), .CK(ck), .RN(n49), .Q(B[8]), .QN(n21) );
  DFFR_X1 C_reg_0_ ( .D(n65), .CK(ck), .RN(n49), .Q(C[0]) );
  DFFR_X1 C_reg_1_ ( .D(n64), .CK(ck), .RN(n49), .Q(C[1]) );
  DFFR_X1 C_reg_2_ ( .D(n63), .CK(ck), .RN(n49), .Q(C[2]) );
  DFFR_X1 C_reg_3_ ( .D(n62), .CK(ck), .RN(n49), .Q(C[3]) );
  DFFR_X1 C_reg_4_ ( .D(n61), .CK(ck), .RN(n49), .Q(C[4]) );
  DFFR_X1 C_reg_5_ ( .D(n60), .CK(ck), .RN(n49), .Q(C[5]) );
  DFFR_X1 C_reg_6_ ( .D(n59), .CK(ck), .RN(n49), .Q(C[6]) );
  DFFR_X1 C_reg_7_ ( .D(n58), .CK(ck), .RN(n49), .Q(C[7]) );
  DFFR_X1 A_cod_reg_0_ ( .D(n57), .CK(ck), .RN(n49), .Q(B[0]) );
  DFFR_X1 A_cod_reg_1_ ( .D(n56), .CK(ck), .RN(n49), .Q(B[1]) );
  DFFR_X1 A_cod_reg_2_ ( .D(n55), .CK(ck), .RN(n49), .Q(B[2]) );
  DFFR_X1 A_cod_reg_3_ ( .D(n54), .CK(ck), .RN(n49), .Q(B[3]) );
  DFFR_X1 A_cod_reg_4_ ( .D(n53), .CK(ck), .RN(n49), .Q(B[4]) );
  DFFR_X1 A_cod_reg_5_ ( .D(n52), .CK(ck), .RN(n49), .Q(B[5]) );
  DFFR_X1 A_cod_reg_6_ ( .D(n51), .CK(ck), .RN(n49), .Q(B[6]) );
  DFFR_X1 A_cod_reg_7_ ( .D(n50), .CK(ck), .RN(n49), .Q(B[7]) );
  INV_X2 U39 ( .A(rst), .ZN(n49) );
  MUX2_X1 U40 ( .A(A[7]), .B(B[7]), .S(N10), .Z(n50) );
  MUX2_X1 U41 ( .A(A[6]), .B(B[6]), .S(N10), .Z(n51) );
  MUX2_X1 U42 ( .A(A[5]), .B(B[5]), .S(N10), .Z(n52) );
  MUX2_X1 U43 ( .A(A[4]), .B(B[4]), .S(N10), .Z(n53) );
  MUX2_X1 U44 ( .A(A[3]), .B(B[3]), .S(N10), .Z(n54) );
  MUX2_X1 U45 ( .A(A[2]), .B(B[2]), .S(N10), .Z(n55) );
  MUX2_X1 U46 ( .A(A[1]), .B(B[1]), .S(N10), .Z(n56) );
  MUX2_X1 U47 ( .A(A[0]), .B(B[0]), .S(N10), .Z(n57) );
  MUX2_X1 U48 ( .A(C_inc[7]), .B(B[7]), .S(n21), .Z(n58) );
  MUX2_X1 U49 ( .A(C_inc[6]), .B(B[6]), .S(n21), .Z(n59) );
  MUX2_X1 U50 ( .A(C_inc[5]), .B(B[5]), .S(n21), .Z(n60) );
  MUX2_X1 U51 ( .A(C_inc[4]), .B(B[4]), .S(n21), .Z(n61) );
  MUX2_X1 U52 ( .A(C_inc[3]), .B(B[3]), .S(n21), .Z(n62) );
  MUX2_X1 U53 ( .A(C_inc[2]), .B(B[2]), .S(n21), .Z(n63) );
  MUX2_X1 U54 ( .A(C_inc[1]), .B(B[1]), .S(n21), .Z(n64) );
  MUX2_X1 U55 ( .A(C_inc[0]), .B(B[0]), .S(n21), .Z(n65) );
  AND2_X1 U56 ( .A1(n39), .A2(n40), .ZN(N10) );
  NOR4_X1 U57 ( .A1(n41), .A2(n42), .A3(n43), .A4(n44), .ZN(n40) );
  XOR2_X1 U58 ( .A(N9), .B(A[7]), .Z(n44) );
  XOR2_X1 U59 ( .A(N4), .B(A[2]), .Z(n43) );
  XOR2_X1 U60 ( .A(N3), .B(A[1]), .Z(n42) );
  XOR2_X1 U61 ( .A(N2), .B(A[0]), .Z(n41) );
  NOR4_X1 U62 ( .A1(n45), .A2(n46), .A3(n47), .A4(n48), .ZN(n39) );
  XOR2_X1 U63 ( .A(N8), .B(A[6]), .Z(n48) );
  XOR2_X1 U64 ( .A(N7), .B(A[5]), .Z(n47) );
  XOR2_X1 U65 ( .A(N6), .B(A[4]), .Z(n46) );
  XOR2_X1 U66 ( .A(N5), .B(A[3]), .Z(n45) );
  XOR2_X1 add_55_U2 ( .A(add_55_carry[7]), .B(C[7]), .Z(C_inc[7]) );
  INV_X1 add_55_U1 ( .A(C[0]), .ZN(C_inc[0]) );
  HA_X1 add_55_U1_1_1 ( .A(C[1]), .B(C[0]), .CO(add_55_carry[2]), .S(C_inc[1])
         );
  HA_X1 add_55_U1_1_2 ( .A(C[2]), .B(add_55_carry[2]), .CO(add_55_carry[3]), 
        .S(C_inc[2]) );
  HA_X1 add_55_U1_1_3 ( .A(C[3]), .B(add_55_carry[3]), .CO(add_55_carry[4]), 
        .S(C_inc[3]) );
  HA_X1 add_55_U1_1_4 ( .A(C[4]), .B(add_55_carry[4]), .CO(add_55_carry[5]), 
        .S(C_inc[4]) );
  HA_X1 add_55_U1_1_5 ( .A(C[5]), .B(add_55_carry[5]), .CO(add_55_carry[6]), 
        .S(C_inc[5]) );
  HA_X1 add_55_U1_1_6 ( .A(C[6]), .B(add_55_carry[6]), .CO(add_55_carry[7]), 
        .S(C_inc[6]) );
  XOR2_X1 add_36_U2 ( .A(add_36_carry[7]), .B(A_notcod[7]), .Z(N9) );
  INV_X1 add_36_U1 ( .A(A_notcod[0]), .ZN(N2) );
  HA_X1 add_36_U1_1_1 ( .A(A_notcod[1]), .B(A_notcod[0]), .CO(add_36_carry[2]), 
        .S(N3) );
  HA_X1 add_36_U1_1_2 ( .A(A_notcod[2]), .B(add_36_carry[2]), .CO(
        add_36_carry[3]), .S(N4) );
  HA_X1 add_36_U1_1_3 ( .A(A_notcod[3]), .B(add_36_carry[3]), .CO(
        add_36_carry[4]), .S(N5) );
  HA_X1 add_36_U1_1_4 ( .A(A_notcod[4]), .B(add_36_carry[4]), .CO(
        add_36_carry[5]), .S(N6) );
  HA_X1 add_36_U1_1_5 ( .A(A_notcod[5]), .B(add_36_carry[5]), .CO(
        add_36_carry[6]), .S(N7) );
  HA_X1 add_36_U1_1_6 ( .A(A_notcod[6]), .B(add_36_carry[6]), .CO(
        add_36_carry[7]), .S(N8) );
endmodule

