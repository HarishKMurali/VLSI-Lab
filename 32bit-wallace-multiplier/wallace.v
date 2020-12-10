`include "partial_products.v"
`include "carry_save_adder.v"

module wallace (
	input [31:0] a,
	input [31:0] b,
	output [63:0] out
);

	wire [31:0][63:0]p_prods;
	partial_products pp (a, b, p_prods);

	wire [9:0][63:0] u_l1, v_l1;
	wire [6:0][63:0] u_l2, v_l2;
	wire [4:0][63:0] u_l3, v_l3;
	wire [2:0][63:0] u_l4, v_l4;
	wire [1:0][63:0] u_l5, v_l5;
	wire [63:0] u_l6,v_l6,u_l7,v_l7,u_l8,v_l8,cout;
	//level-1
	FA l11(p_prods[0], p_prods[1], p_prods[2], u_l1[0], v_l1[0]);
	FA l12(p_prods[3], p_prods[4], p_prods[5], u_l1[1], v_l1[1]);
	FA l13(p_prods[6], p_prods[7], p_prods[8], u_l1[2], v_l1[2]);
	FA l14(p_prods[9], p_prods[10], p_prods[11], u_l1[3], v_l1[3]);
	FA l15(p_prods[12], p_prods[13], p_prods[14], u_l1[4], v_l1[4]);
	FA l16(p_prods[15], p_prods[16], p_prods[17], u_l1[5], v_l1[5]);
	FA l17(p_prods[18], p_prods[19], p_prods[20], u_l1[6], v_l1[6]);
	FA l18(p_prods[21], p_prods[22], p_prods[23], u_l1[7], v_l1[7]);
	FA l19(p_prods[24], p_prods[25], p_prods[26], u_l1[8], v_l1[8]);
	FA l110(p_prods[27], p_prods[28], p_prods[29], u_l1[9], v_l1[9]);

	//level-2
	FA l21(u_l1[0],v_l1[0],u_l1[1], u_l2[0], v_l2[0]);
	FA l22(v_l1[1],u_l1[2],v_l1[2], u_l2[1], v_l2[1]);
	FA l23(u_l1[3],v_l1[3],u_l1[4], u_l2[2], v_l2[2]);
	FA l24(v_l1[4],u_l1[5],v_l1[5], u_l2[3], v_l2[3]);
	FA l25(u_l1[6],v_l1[6],u_l1[7], u_l2[4], v_l2[4]);
	FA l26(v_l1[7],u_l1[8],v_l1[8], u_l2[5], v_l2[5]);
	FA l27(u_l1[9],v_l1[9],p_prods[30],u_l2[6], v_l2[6]);

	//level-3
	FA l31(u_l2[0],v_l2[0],u_l2[1],u_l3[0],v_l3[0]);
	FA l32(v_l2[1],u_l2[2],v_l2[2],u_l3[1],v_l3[1]);
	FA l33(u_l2[3],v_l2[3],u_l2[4],u_l3[2],v_l3[2]);
	FA l34(v_l2[4],u_l2[5],v_l2[5],u_l3[3],v_l3[3]);
	FA l35(u_l2[6],v_l2[6],p_prods[31],u_l3[4],v_l3[4]);

	//level-4
	FA l41(u_l3[0],v_l3[0],u_l3[1],u_l4[0],v_l4[0]);
	FA l42(v_l3[1],u_l3[2],v_l3[2],u_l4[1],v_l4[1]);
	FA l43(u_l3[3],v_l3[3],u_l3[4],u_l4[2],v_l4[2]);

	//level-5
	FA l51(u_l4[0],v_l4[0],u_l4[1],u_l5[0],v_l5[0]);
	FA l52(v_l4[1],u_l4[2],v_l4[2],u_l5[1],v_l5[1]);

	//level-6
	FA l61(u_l5[0],v_l5[0],u_l5[1],u_l6,v_l6);

	//level-7
	FA l71(u_l6,v_l6,v_l5[1],u_l7,v_l7);

	//level-8
	FA l81(u_l7,v_l7,v_l3[4],u_l8,v_l8);

	//final result
	FA l9(u_l8,v_l8,64'b0,out,cout);
	


endmodule