`include "compressors.v"
`include "../32_bit_adder_recursive_doubling/fast_adder.v"


module dadda(a,b,product);
	input [15:0] a,b;
	output [31:0] product;

	wire [1:31]level1[1:16];
	wire [1:31]level2[1:8];
	wire [1:31]level3[1:4];
	wire [1:31]level4[1:2];
	
	

	assign level1[1][1] = a[15]&b[15];
	assign level1[1][2] = a[14]&b[15];
	assign level1[1][3] = a[13]&b[15];
	assign level1[1][4] = a[12]&b[15];
	assign level1[1][5] = a[11]&b[15];
	assign level1[1][6] = a[10]&b[15];
	assign level1[1][7] = a[9]&b[15];
	assign level1[1][8] = a[8]&b[15];
	assign level1[1][9] = a[7]&b[15];
	assign level1[1][10] = a[6]&b[15];
	assign level1[1][11] = a[5]&b[15];
	assign level1[1][12] = a[4]&b[15];
	assign level1[1][13] = a[3]&b[15];
	assign level1[1][14] = a[2]&b[15];
	assign level1[1][15] = a[1]&b[15];
	assign level1[1][16] = a[0]&b[15];
	assign level1[1][17] = a[0]&b[14];
	assign level1[1][18] = a[0]&b[13];
	assign level1[1][19] = a[0]&b[12];
	assign level1[1][20] = a[0]&b[11];
	assign level1[1][21] = a[0]&b[10];
	assign level1[1][22] = a[0]&b[9];
	assign level1[1][23] = a[0]&b[8];
	assign level1[1][24] = a[0]&b[7];
	assign level1[1][25] = a[0]&b[6];
	assign level1[1][26] = a[0]&b[5];
	assign level1[1][27] = a[0]&b[4];
	assign level1[1][28] = a[0]&b[3];
	assign level1[1][29] = a[0]&b[2];
	assign level1[1][30] = a[0]&b[1];
	assign level1[1][31] = a[0]&b[0];

	assign level1[2][2] = a[15]&b[14];
	assign level1[2][3] = a[14]&b[14];
	assign level1[2][4] = a[13]&b[14];
	assign level1[2][5] = a[12]&b[14];
	assign level1[2][6] = a[11]&b[14];
	assign level1[2][7] = a[10]&b[14];
	assign level1[2][8] = a[9]&b[14];
	assign level1[2][9] = a[8]&b[14];
	assign level1[2][10] = a[7]&b[14];
	assign level1[2][11] = a[6]&b[14];
	assign level1[2][12] = a[5]&b[14];
	assign level1[2][13] = a[4]&b[14];
	assign level1[2][14] = a[3]&b[14];
	assign level1[2][15] = a[2]&b[14];
	assign level1[2][16] = a[1]&b[14];
	assign level1[2][17] = a[1]&b[13];
	assign level1[2][18] = a[1]&b[12];
	assign level1[2][19] = a[1]&b[11];
	assign level1[2][20] = a[1]&b[10];
	assign level1[2][21] = a[1]&b[9];
	assign level1[2][22] = a[1]&b[8];
	assign level1[2][23] = a[1]&b[7];
	assign level1[2][24] = a[1]&b[6];
	assign level1[2][25] = a[1]&b[5];
	assign level1[2][26] = a[1]&b[4];
	assign level1[2][27] = a[1]&b[3];
	assign level1[2][28] = a[1]&b[2];
	assign level1[2][29] = a[1]&b[1];
	assign level1[2][30] = a[1]&b[0];

	assign level1[3][3] = a[15]&b[13];
	assign level1[3][4] = a[14]&b[13];
	assign level1[3][5] = a[13]&b[13];
	assign level1[3][6] = a[12]&b[13];
	assign level1[3][7] = a[11]&b[13];
	assign level1[3][8] = a[10]&b[13];
	assign level1[3][9] = a[9]&b[13];
	assign level1[3][10] = a[8]&b[13];
	assign level1[3][11] = a[7]&b[13];
	assign level1[3][12] = a[6]&b[13];
	assign level1[3][13] = a[5]&b[13];
	assign level1[3][14] = a[4]&b[13];
	assign level1[3][15] = a[3]&b[13];
	assign level1[3][16] = a[2]&b[13];
	assign level1[3][17] = a[2]&b[12];
	assign level1[3][18] = a[2]&b[11];
	assign level1[3][19] = a[2]&b[10];
	assign level1[3][20] = a[2]&b[9];
	assign level1[3][21] = a[2]&b[8];
	assign level1[3][22] = a[2]&b[7];
	assign level1[3][23] = a[2]&b[6];
	assign level1[3][24] = a[2]&b[5];
	assign level1[3][25] = a[2]&b[4];
	assign level1[3][26] = a[2]&b[3];
	assign level1[3][27] = a[2]&b[2];
	assign level1[3][28] = a[2]&b[1];
	assign level1[3][29] = a[2]&b[0];

	assign level1[4][4] = a[15]&b[12];
	assign level1[4][5] = a[14]&b[12];
	assign level1[4][6] = a[13]&b[12];
	assign level1[4][7] = a[12]&b[12];
	assign level1[4][8] = a[11]&b[12];
	assign level1[4][9] = a[10]&b[12];
	assign level1[4][10] = a[9]&b[12];
	assign level1[4][11] = a[8]&b[12];
	assign level1[4][12] = a[7]&b[12];
	assign level1[4][13] = a[6]&b[12];
	assign level1[4][14] = a[5]&b[12];
	assign level1[4][15] = a[4]&b[12];
	assign level1[4][16] = a[3]&b[12];
	assign level1[4][17] = a[3]&b[11];
	assign level1[4][18] = a[3]&b[10];
	assign level1[4][19] = a[3]&b[9];
	assign level1[4][20] = a[3]&b[8];
	assign level1[4][21] = a[3]&b[7];
	assign level1[4][22] = a[3]&b[6];
	assign level1[4][23] = a[3]&b[5];
	assign level1[4][24] = a[3]&b[4];
	assign level1[4][25] = a[3]&b[3];
	assign level1[4][26] = a[3]&b[2];
	assign level1[4][27] = a[3]&b[1];
	assign level1[4][28] = a[3]&b[0];

	assign level1[5][5] = a[15]&b[11];
	assign level1[5][6] = a[14]&b[11];
	assign level1[5][7] = a[13]&b[11];
	assign level1[5][8] = a[12]&b[11];
	assign level1[5][9] = a[11]&b[11];
	assign level1[5][10] = a[10]&b[11];
	assign level1[5][11] = a[9]&b[11];
	assign level1[5][12] = a[8]&b[11];
	assign level1[5][13] = a[7]&b[11];
	assign level1[5][14] = a[6]&b[11];
	assign level1[5][15] = a[5]&b[11];
	assign level1[5][16] = a[4]&b[11];
	assign level1[5][17] = a[4]&b[10];
	assign level1[5][18] = a[4]&b[9];
	assign level1[5][19] = a[4]&b[8];
	assign level1[5][20] = a[4]&b[7];
	assign level1[5][21] = a[4]&b[6];
	assign level1[5][22] = a[4]&b[5];
	assign level1[5][23] = a[4]&b[4];
	assign level1[5][24] = a[4]&b[3];
	assign level1[5][25] = a[4]&b[2];
	assign level1[5][26] = a[4]&b[1];
	assign level1[5][27] = a[4]&b[0];

	assign level1[6][6] = a[15]&b[10];
	assign level1[6][7] = a[14]&b[10];
	assign level1[6][8] = a[13]&b[10];
	assign level1[6][9] = a[12]&b[10];
	assign level1[6][10] = a[11]&b[10];
	assign level1[6][11] = a[10]&b[10];
	assign level1[6][12] = a[9]&b[10];
	assign level1[6][13] = a[8]&b[10];
	assign level1[6][14] = a[7]&b[10];
	assign level1[6][15] = a[6]&b[10];
	assign level1[6][16] = a[5]&b[10];
	assign level1[6][17] = a[5]&b[9];
	assign level1[6][18] = a[5]&b[8];
	assign level1[6][19] = a[5]&b[7];
	assign level1[6][20] = a[5]&b[6];
	assign level1[6][21] = a[5]&b[5];
	assign level1[6][22] = a[5]&b[4];
	assign level1[6][23] = a[5]&b[3];
	assign level1[6][24] = a[5]&b[2];
	assign level1[6][25] = a[5]&b[1];
	assign level1[6][26] = a[5]&b[0];

	assign level1[7][7] = a[15]&b[9];
	assign level1[7][8] = a[14]&b[9];
	assign level1[7][9] = a[13]&b[9];
	assign level1[7][10] = a[12]&b[9];
	assign level1[7][11] = a[11]&b[9];
	assign level1[7][12] = a[10]&b[9];
	assign level1[7][13] = a[9]&b[9];
	assign level1[7][14] = a[8]&b[9];
	assign level1[7][15] = a[7]&b[9];
	assign level1[7][16] = a[6]&b[9];
	assign level1[7][17] = a[6]&b[8];
	assign level1[7][18] = a[6]&b[7];
	assign level1[7][19] = a[6]&b[6];
	assign level1[7][20] = a[6]&b[5];
	assign level1[7][21] = a[6]&b[4];
	assign level1[7][22] = a[6]&b[3];
	assign level1[7][23] = a[6]&b[2];
	assign level1[7][24] = a[6]&b[1];
	assign level1[7][25] = a[6]&b[0];

	assign level1[8][8] = a[15]&b[8];
	assign level1[8][9] = a[14]&b[8];
	assign level1[8][10] = a[13]&b[8];
	assign level1[8][11] = a[12]&b[8];
	assign level1[8][12] = a[11]&b[8];
	assign level1[8][13] = a[10]&b[8];
	assign level1[8][14] = a[9]&b[8];
	assign level1[8][15] = a[8]&b[8];
	assign level1[8][16] = a[7]&b[8];
	assign level1[8][17] = a[7]&b[7];
	assign level1[8][18] = a[7]&b[6];
	assign level1[8][19] = a[7]&b[5];
	assign level1[8][20] = a[7]&b[4];
	assign level1[8][21] = a[7]&b[3];
	assign level1[8][22] = a[7]&b[2];
	assign level1[8][23] = a[7]&b[1];
	assign level1[8][24] = a[7]&b[0];

	assign level1[9][9] = a[15]&b[7];
	assign level1[9][10] = a[14]&b[7];
	assign level1[9][11] = a[13]&b[7];
	assign level1[9][12] = a[12]&b[7];
	assign level1[9][13] = a[11]&b[7];
	assign level1[9][14] = a[10]&b[7];
	assign level1[9][15] = a[9]&b[7];
	assign level1[9][16] = a[8]&b[7];
	assign level1[9][17] = a[8]&b[6];
	assign level1[9][18] = a[8]&b[5];
	assign level1[9][19] = a[8]&b[4];
	assign level1[9][20] = a[8]&b[3];
	assign level1[9][21] = a[8]&b[2];
	assign level1[9][22] = a[8]&b[1];
	assign level1[9][23] = a[8]&b[0];

	assign level1[10][10] = a[15]&b[6];
	assign level1[10][11] = a[14]&b[6];
	assign level1[10][12] = a[13]&b[6];
	assign level1[10][13] = a[12]&b[6];
	assign level1[10][14] = a[11]&b[6];
	assign level1[10][15] = a[10]&b[6];
	assign level1[10][16] = a[9]&b[6];
	assign level1[10][17] = a[9]&b[5];
	assign level1[10][18] = a[9]&b[4];
	assign level1[10][19] = a[9]&b[3];
	assign level1[10][20] = a[9]&b[2];
	assign level1[10][21] = a[9]&b[1];
	assign level1[10][22] = a[9]&b[0];

	assign level1[11][11] = a[15]&b[5];
	assign level1[11][12] = a[14]&b[5];
	assign level1[11][13] = a[13]&b[5];
	assign level1[11][14] = a[12]&b[5];
	assign level1[11][15] = a[11]&b[5];
	assign level1[11][16] = a[10]&b[5];
	assign level1[11][17] = a[10]&b[4];
	assign level1[11][18] = a[10]&b[3];
	assign level1[11][19] = a[10]&b[2];
	assign level1[11][20] = a[10]&b[1];
	assign level1[11][21] = a[10]&b[0];

	assign level1[12][12] = a[15]&b[4];
	assign level1[12][13] = a[14]&b[4];
	assign level1[12][14] = a[13]&b[4];
	assign level1[12][15] = a[12]&b[4];
	assign level1[12][16] = a[11]&b[4];
	assign level1[12][17] = a[11]&b[3];
	assign level1[12][18] = a[11]&b[2];
	assign level1[12][19] = a[11]&b[1];
	assign level1[12][20] = a[11]&b[0];

	assign level1[13][13] = a[15]&b[3];
	assign level1[13][14] = a[14]&b[3];
	assign level1[13][15] = a[13]&b[3];
	assign level1[13][16] = a[12]&b[3];
	assign level1[13][17] = a[12]&b[2];
	assign level1[13][18] = a[12]&b[1];
	assign level1[13][19] = a[12]&b[0];

	assign level1[14][14] = a[15]&b[2];
	assign level1[14][15] = a[14]&b[2];
	assign level1[14][16] = a[13]&b[2];
	assign level1[14][17] = a[13]&b[1];
	assign level1[14][18] = a[13]&b[0];

	assign level1[15][15] = a[15]&b[1];
	assign level1[15][16] = a[14]&b[1];
	assign level1[15][17] = a[14]&b[0];

	assign level1[16][16] = a[15]&b[0]; 

// LEVEL 1 to 2 -----------------------------------------------------------
	
	genvar i,j;
	// col 31 to 24
	generate
		for(i=1;i<=8;i=i+1)
			for(j=24;j<=31;j=j+1)
				assign level2[i][j]=level1[i][j];
	endgenerate

	// col 23
	ha x2(level1[1][23],level1[2][23],level2[1][23],level2[8][22]);

	generate
	for(i=2;i<=8;i=i+1)
		assign level2[i][23]=level1[i+1][23];
	endgenerate

	// col 22
	four_two w2(level1[1][22],level1[2][22],level1[3][22],level1[4][22],1'b0,level2[1][22],level2[7][21],level2[8][21]);

	generate
	for(i=2;i<=7;i=i+1)
		assign level2[i][22]=level1[i+3][22];
	endgenerate

	// col 21
	//5input
	four_two v2(level1[1][21],level1[2][21],level1[3][21],level1[4][21],level1[5][21],level2[1][21],level2[6][20],level2[7][20]);
	ha v7(level1[6][21],level1[7][21],level2[2][21],level2[8][20]);

	generate
	for(i=3;i<=6;i=i+1)
		assign level2[i][21]=level1[i+5][21];
	endgenerate

	// col 20
	//5input
	four_two u2(level1[1][20],level1[2][20],level1[3][20],level1[4][20],level1[5][20],level2[1][20],level2[5][19],level2[6][19]);
	//4input
	four_two u7(level1[6][20],level1[7][20],level1[8][20],level1[9][20],1'b0,level2[2][20],level2[7][19],level2[8][19]);
	
	generate
	for(i=3;i<=5;i=i+1)
		assign level2[i][20]=level1[i+7][20];
	endgenerate

	// col 19
	//5input
	four_two t2(level1[1][19],level1[2][19],level1[3][19],level1[4][19],level1[5][19],level2[1][19],level2[4][18],level2[5][18]);
	//5input
	four_two t7(level1[6][19],level1[7][19],level1[8][19],level1[9][19],level1[10][19],level2[2][19],level2[6][18],level2[7][18]);
	ha t12(level1[11][19],level1[12][19],level2[3][19],level2[8][18]);
	assign level2[4][19]=level1[13][19];

	// col 18
	wire c18_carry[1:0];
	//5input
	four_two s2(level1[1][18],level1[2][18],level1[3][18],level1[4][18],level1[5][18],level2[1][18],c18_carry[0],c18_carry[1]);
	//5input
	four_two s7(level1[6][18],level1[7][18],level1[8][18],level1[9][18],level1[10][18],level2[2][18],level2[5][17],level2[6][17]);
	//4input
	four_two s12(level1[11][18],level1[12][18],level1[13][18],level1[14][18],1'b0,level2[3][18],level2[7][17],level2[8][17]);

	// col 17
	wire c17_carry[2:0];
	//5input
	four_two r2(level1[1][17],level1[2][17],level1[3][17],level1[4][17],level1[5][17],level2[1][17],c17_carry[0],c17_carry[1]);
	//5input
	four_two r7(level1[6][17],level1[7][17],level1[8][17],level1[9][17],level1[10][17],level2[2][17],c17_carry[2],level2[5][16]);
	//5input
	four_two r12(level1[11][17],level1[12][17],level1[13][17],level1[14][17],level1[15][17],level2[3][17],level2[6][16],level2[7][16]);
	ha r18(c18_carry[0],c18_carry[1],level2[4][17],level2[8][16]);

	// col 16
	wire c16_carry[3:0];  
	//5input
	four_two q2(level1[1][16],level1[2][16],level1[3][16],level1[4][16],level1[5][16],level2[1][16],level2[5][15],level2[6][15]);
	//5input
	four_two q7(level1[6][16],level1[7][16],level1[8][16],level1[9][16],level1[10][16],level2[2][16],level2[7][15],level2[8][15]);
	//5input
	four_two q12(level1[11][16],level1[12][16],level1[13][16],level1[14][16],level1[15][16],level2[3][16],c16_carry[0],c16_carry[1]);
	//4input
	four_two q17(level1[16][16],c17_carry[0],c17_carry[1],c17_carry[2],1'b0,level2[4][16],c16_carry[2],c16_carry[3]);

	// col 15
	wire c15_carry[3:0];
	//5input
	four_two p2(level1[1][15],level1[2][15],level1[3][15],level1[4][15],level1[5][15],level2[1][15],level2[5][14],level2[6][14]);
	//5input
	four_two p7(level1[6][15],level1[7][15],level1[8][15],level1[9][15],level1[10][15],level2[2][15],level2[7][14],level2[8][14]);
	//5input
	four_two p12(level1[11][15],level1[12][15],level1[13][15],level1[14][15],level1[15][15],level2[3][15],c15_carry[0],c15_carry[1]);
	//4input
	four_two p18(c16_carry[0],c16_carry[1],c16_carry[2],c16_carry[3],1'b0,level2[4][15],c15_carry[2],c15_carry[3]);

	// col 14
	wire c14_carry[1:0];
	//5input
	four_two o2(level1[1][14],level1[2][14],level1[3][14],level1[4][14],level1[5][14],level2[1][14],level2[4][13],level2[5][13]);
	//5input
	four_two o7(level1[6][14],level1[7][14],level1[8][14],level1[9][14],level1[10][14],level2[2][14],level2[6][13],level2[7][13]);
	//5input
	four_two o12(level1[11][14],level1[12][14],level1[13][14],level1[14][14],c15_carry[0],level2[3][14],level2[8][13],c14_carry[0]);
	fa o18(c15_carry[1],c15_carry[2],c15_carry[3],level2[4][14],c14_carry[1]);

	// col 13
	wire c13_carry;
	//5input
	four_two n2(level1[1][13],level1[2][13],level1[3][13],level1[4][13],level1[5][13],level2[1][13],level2[4][12],level2[5][12]);
	//5input
	four_two n7(level1[6][13],level1[7][13],level1[8][13],level1[9][13],level1[10][13],level2[2][13],level2[6][12],level2[7][12]);
	//5input
	four_two n12(level1[11][13],level1[12][13],level1[13][13],c14_carry[0],c14_carry[1],level2[3][13],level2[8][12],c13_carry);

	// col 12
	//5input
	four_two m2(level1[1][12],level1[2][12],level1[3][12],level1[4][12],level1[5][12],level2[1][12],level2[4][11],level2[5][11]);
	//5input
	four_two m7(level1[6][12],level1[7][12],level1[8][12],level1[9][12],level1[10][12],level2[2][12],level2[6][11],level2[7][11]);
	fa m12(level1[11][12],level1[12][12],c13_carry,level2[3][12],level2[8][11]);

	// col 11
	//5input
	four_two l2(level1[1][11],level1[2][11],level1[3][11],level1[4][11],level1[5][11],level2[1][11],level2[5][10],level2[6][10]);
	//5input
	four_two l7(level1[6][11],level1[7][11],level1[8][11],level1[9][11],level1[10][11],level2[2][11],level2[7][10],level2[8][10]);
	assign level2[3][11]=level1[11][11];

	// col 10
	//5input
	four_two k2(level1[1][10],level1[2][10],level1[3][10],level1[4][10],level1[5][10],level2[1][10],level2[6][9],level2[7][9]);
	fa k7(level1[6][10],level1[7][10],level1[8][10],level2[2][10],level2[8][9]);
	assign level2[3][10]=level1[9][10];
	assign level2[4][10]=level1[10][10];

	// col 9
	//5input
	four_two j2(level1[1][9],level1[2][9],level1[3][9],level1[4][9],level1[5][9],level2[1][9],level2[7][8],level2[8][8]);
	generate
	for(i=2;i<=5;i=i+1)
		assign level2[i][9]=level1[i+4][9];
	endgenerate

	// col 8
	fa i2(level1[1][8],level1[2][8],level1[3][8],level2[1][8],level2[8][7]);
	generate
	for(i=2;i<=6;i=i+1)
		assign level2[i][8]=level1[i+2][8];
	endgenerate

	// col 7 to 1
	generate
		for(i=1;i<=8;i=i+1)
			for(j=1;j<=7;j=j+1)
				assign level2[i][j]=level1[i][j];
	endgenerate

// always@(*)
	// $monitor("%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n",level2[1],level2[2],level2[3],level2[4],level2[5],level2[6],level2[7],level2[8]);
	// $monitor("%b\n%b\n%b\n%b\n",level3[1],level3[2],level3[3],level3[4]);
	// $monitor("%b\n%b\n",level4[1],level4[2]);
	// $monitor("bin %b\ndec %d\n",product,product);

// LEVEL 2 to 3 -----------------------------------------------------------
	
	//col 31 to 28
	generate
		for(i=1;i<=4;i=i+1)
			for(j=28;j<=31;j=j+1)
				assign level3[i][j]=level2[i][j];
	endgenerate

	//col 27
    ha ab46(level2[1][27],level2[2][27],level3[1][27],level3[4][26]);
		generate
		for(i=2;i<=4;i=i+1)
			assign level3[i][27]=level2[i+1][27];
		endgenerate

    //col 26
    //4input
    four_two aa46(level2[1][26],level2[2][26],level2[3][26],level2[4][26],1'b0,level3[1][26],level3[4][25],level3[3][25]);
		generate
		for(i=2;i<=3;i=i+1)
			assign level3[i][26]=level2[i+3][26];
		endgenerate
    //column 25
		wire l2_c25carry ;
    //5input
    four_two z46(level2[1][25],level2[2][25],level2[3][25],level2[4][25],level2[5][25],level3[1][25],level3[4][24],level3[3][24]);
	
    ha z51(level2[6][25],level2[7][25],level3[2][25],l2_c25carry);

    //column 24
    //5input
	wire l2_c24carry[1:0];
    four_two y46(level2[1][24],level2[2][24],level2[3][24],level2[4][24],level2[5][24],level3[1][24],l2_c24carry[0],l2_c24carry[1]);
	
    //4input
    four_two y51(level2[6][24],level2[7][24],level2[8][24],l2_c25carry,1'b0,level3[2][24],level3[3][23],level3[4][23]);
	
	//column 23
	wire l2_c23carry[1:0];
	//5input
	four_two x46(level2[1][23],level2[2][23],level2[3][23],level2[4][23],level2[5][23],level3[1][23],l2_c23carry[0],l2_c23carry[1]);
	//5input
	four_two x51(level2[6][23],level2[7][23],level2[8][23],l2_c24carry[1],l2_c24carry[0],level3[2][23],level3[3][22],level3[4][22]);

	//column 22
	wire l2_c22carry[1:0];
	//5input
	four_two w46(level2[1][22],level2[2][22],level2[3][22],level2[4][22],level2[5][22],level3[1][22],l2_c22carry[0],l2_c22carry[1]);
	//5input
	four_two w51(level2[6][22],level2[7][22],level2[8][22],l2_c23carry[1],l2_c23carry[0],level3[2][22],level3[3][21],level3[4][21]);

	//column 21
	wire l2_c21carry[1:0];
	//5input
	four_two v46(level2[1][21],level2[2][21],level2[3][21],level2[4][21],level2[5][21],level3[1][21],l2_c21carry[0],l2_c21carry[1]);
	//5input
	four_two v51(level2[6][21],level2[7][21],level2[8][21],l2_c22carry[1],l2_c22carry[0],level3[2][21],level3[3][20],level3[4][20]);

	//column 20
	wire l2_c20carry[1:0];
	//5input
	four_two u46(level2[1][20],level2[2][20],level2[3][20],level2[4][20],level2[5][20],level3[1][20],l2_c20carry[0],l2_c20carry[1]);
	//5input
	four_two u51(level2[6][20],level2[7][20],level2[8][20],l2_c21carry[1],l2_c21carry[0],level3[2][20],level3[3][19],level3[4][19]);

	//column 19
	wire l2_c19carry[1:0];
	//5input
	four_two t46(level2[1][19],level2[2][19],level2[3][19],level2[4][19],level2[5][19],level3[1][19],l2_c19carry[0],l2_c19carry[1]);
	//5input
	four_two t51(level2[6][19],level2[7][19],level2[8][19],l2_c20carry[1],l2_c20carry[0],level3[2][19],level3[3][18],level3[4][18]);

	//column 18
	wire l2_c18carry[1:0];
	//5input
	four_two s46(level2[1][18],level2[2][18],level2[3][18],level2[4][18],level2[5][18],level3[1][18],l2_c18carry[0],l2_c18carry[1]);
	//5input
	four_two s51(level2[6][18],level2[7][18],level2[8][18],l2_c19carry[1],l2_c19carry[0],level3[2][18],level3[3][17],level3[4][17]);

	//column 17
	wire l2_c17carry[1:0];
	//5input
	four_two r46(level2[1][17],level2[2][17],level2[3][17],level2[4][17],level2[5][17],level3[1][17],l2_c17carry[0],l2_c17carry[1]);
	//5input
	four_two r51(level2[6][17],level2[7][17],level2[8][17],l2_c18carry[1],l2_c18carry[0],level3[2][17],level3[3][16],level3[4][16]);

	//column 16
	wire l2_c16carry[1:0];
	//5input
	four_two q46(level2[1][16],level2[2][16],level2[3][16],level2[4][16],level2[5][16],level3[1][16],l2_c16carry[0],l2_c16carry[1]);
	//5input
	four_two q51(level2[6][16],level2[7][16],level2[8][16],l2_c17carry[1],l2_c17carry[0],level3[2][16],level3[3][15],level3[4][15]);

	//column 15
	wire l2_c15carry[1:0];
	//5input
	four_two p46(level2[1][15],level2[2][15],level2[3][15],level2[4][15],level2[5][15],level3[1][15],l2_c15carry[0],l2_c15carry[1]);
	//5input
	four_two p51(level2[6][15],level2[7][15],level2[8][15],l2_c16carry[1],l2_c16carry[0],level3[2][15],level3[3][14],level3[4][14]);

	//column 14
	wire l2_c14carry[1:0];
	//5input
	four_two o46(level2[1][14],level2[2][14],level2[3][14],level2[4][14],level2[5][14],level3[1][14],l2_c14carry[0],l2_c14carry[1]);
	//5input
	four_two o51(level2[6][14],level2[7][14],level2[8][14],l2_c15carry[1],l2_c15carry[0],level3[2][14],level3[3][13],level3[4][13]);

	//column 13
	wire l2_c13carry[1:0];
	//5input
	four_two n46(level2[1][13],level2[2][13],level2[3][13],level2[4][13],level2[5][13],level3[1][13],l2_c13carry[0],l2_c13carry[1]);
	//5input
	four_two n51(level2[6][13],level2[7][13],level2[8][13],l2_c14carry[1],l2_c14carry[0],level3[2][13],level3[3][12],level3[4][12]);

	//column 12
	wire l2_c12carry[1:0];
	//5input
	four_two m46(level2[1][12],level2[2][12],level2[3][12],level2[4][12],level2[5][12],level3[1][12],l2_c12carry[0],l2_c12carry[1]);
	//5input
	four_two m51(level2[6][12],level2[7][12],level2[8][12],l2_c13carry[1],l2_c13carry[0],level3[2][12],level3[3][11],level3[4][11]);

	//column 11
	wire l2_c11carry[1:0];
	//5input
	four_two l46(level2[1][11],level2[2][11],level2[3][11],level2[4][11],level2[5][11],level3[1][11],l2_c11carry[0],l2_c11carry[1]);
	//5input
	four_two l51(level2[6][11],level2[7][11],level2[8][11],l2_c12carry[1],l2_c12carry[0],level3[2][11],level3[3][10],level3[4][10]);

	//column 10
	wire l2_c10carry[1:0];
	//5input
	four_two k46(level2[1][10],level2[2][10],level2[3][10],level2[4][10],level2[5][10],level3[1][10],l2_c10carry[0],l2_c10carry[1]);
	//5input
	four_two k51(level2[6][10],level2[7][10],level2[8][10],l2_c11carry[1],l2_c11carry[0],level3[2][10],level3[3][9],level3[4][9]);

	//column 9
	wire l2_c9carry[1:0];
	//5input
	four_two j46(level2[1][9],level2[2][9],level2[3][9],level2[4][9],level2[5][9],level3[1][9],l2_c9carry[0],l2_c9carry[1]);
	//5input
	four_two j51(level2[6][9],level2[7][9],level2[8][9],l2_c10carry[1],l2_c10carry[0],level3[2][9],level3[3][8],level3[4][8]);

	//column 8
	wire l2_c8carry[1:0];
	//5input
	four_two i46(level2[1][8],level2[2][8],level2[3][8],level2[4][8],level2[5][8],level3[1][8],l2_c8carry[0],l2_c8carry[1]);
	//5input
	four_two i51(level2[6][8],level2[7][8],level2[8][8],l2_c9carry[1],l2_c9carry[0],level3[2][8],level3[3][7],level3[4][7]);

	//column 7
	wire l2_c7carry[1:0];
	//5input
	four_two h46(level2[1][7],level2[2][7],level2[3][7],level2[4][7],level2[5][7],level3[1][7],l2_c7carry[0],l2_c7carry[1]);
	//5input
	four_two h51(level2[6][7],level2[7][7],level2[8][7],l2_c8carry[1],l2_c8carry[0],level3[2][7],level3[3][6],level3[4][6]);


    // // //col 7
    // // //5input
	// // wire l2_c7carry [1:0];
    // // four_two h46(level2[1][7],level2[2][7],level2[3][7],level2[4][7],level2[5][7],level3[1][7],l2_c7carry[0],l2_c7carry[1]);
	
    // //5input
    // four_two h51(level2[6][7],level2[7][7],level2[8][7],l2_c8carry[1],l2_c8carry[0],level3[2][7],level3[3][6],level3[4][6]);
	
    //col 6
    //5input

    four_two g46(level2[1][6],level2[2][6],level2[3][6],level2[4][6],level2[5][6],level3[1][6],level3[4][5],level3[3][5]);
	
    fa g51(level2[6][6],l2_c7carry[0],l2_c7carry[1],level3[2][6],level3[2][5]);

    //col 5
    //5input
    four_two f46(level2[1][5],level2[2][5],level2[3][5],level2[4][5],level2[5][5],level3[1][5],level3[3][4],level3[4][4]);
	
    //col 4
    fa e46(level2[1][4],level2[2][4],level2[3][4],level3[1][4],level3[4][3]);
	
		assign level3[2][4]=level2[4][4];
		//col 3 to 1
		generate
		for(i=1;i<=3;i=i+1)
			for(j=1;j<=3;j=j+1)
				assign level3[i][j]=level2[i][j];
		endgenerate
		
	
	
// // LEVEL 3 to 4 -----------------------------------------------------------

	assign level4[2][31]=1'b0;
	generate
		for(i=1;i<=2;i=i+1)
			for(j=30;j<=31;j=j+1)
				assign level4[i][j]=level3[i][j];
	endgenerate
	//col 29
	ha ad66(level3[1][29],level3[2][29],level4[1][29],level4[2][28]);
	assign level4[2][29]=level3[3][29];

	//col 28
	wire l3_c28carry;
	//4input
	four_two ac66(level3[1][28],level3[2][28],level3[3][28],level3[4][28],1'b0,level4[1][28],level4[2][27],l3_c28carry);

	//column 27
	wire l3_c27carry;
	//5input
	four_two ab66(level3[1][27],level3[2][27],level3[3][27],level3[4][27],l3_c28carry,level4[1][27],l3_c27carry,level4[2][26]);

	//column 26
	wire l3_c26carry;
	//5input
	four_two aa66(level3[1][26],level3[2][26],level3[3][26],level3[4][26],l3_c27carry,level4[1][26],l3_c26carry,level4[2][25]);

	//column 25
	wire l3_c25carry;
	//5input
	four_two z66(level3[1][25],level3[2][25],level3[3][25],level3[4][25],l3_c26carry,level4[1][25],l3_c25carry,level4[2][24]);

	//column 24
	wire l3_c24carry;
	//5input
	four_two y66(level3[1][24],level3[2][24],level3[3][24],level3[4][24],l3_c25carry,level4[1][24],l3_c24carry,level4[2][23]);

	//column 23
	wire l3_c23carry;
	//5input
	four_two x66(level3[1][23],level3[2][23],level3[3][23],level3[4][23],l3_c24carry,level4[1][23],l3_c23carry,level4[2][22]);

	//column 22
	wire l3_c22carry;
	//5input
	four_two w66(level3[1][22],level3[2][22],level3[3][22],level3[4][22],l3_c23carry,level4[1][22],l3_c22carry,level4[2][21]);

	//column 21
	wire l3_c21carry;
	//5input
	four_two v66(level3[1][21],level3[2][21],level3[3][21],level3[4][21],l3_c22carry,level4[1][21],l3_c21carry,level4[2][20]);

	//column 20
	wire l3_c20carry;
	//5input
	four_two u66(level3[1][20],level3[2][20],level3[3][20],level3[4][20],l3_c21carry,level4[1][20],l3_c20carry,level4[2][19]);

	//column 19
	wire l3_c19carry;
	//5input
	four_two t66(level3[1][19],level3[2][19],level3[3][19],level3[4][19],l3_c20carry,level4[1][19],l3_c19carry,level4[2][18]);

	//column 18
	wire l3_c18carry;
	//5input
	four_two s66(level3[1][18],level3[2][18],level3[3][18],level3[4][18],l3_c19carry,level4[1][18],l3_c18carry,level4[2][17]);

	//column 17
	wire l3_c17carry;
	//5input
	four_two r66(level3[1][17],level3[2][17],level3[3][17],level3[4][17],l3_c18carry,level4[1][17],l3_c17carry,level4[2][16]);

	//column 16
	wire l3_c16carry;
	//5input
	four_two q66(level3[1][16],level3[2][16],level3[3][16],level3[4][16],l3_c17carry,level4[1][16],l3_c16carry,level4[2][15]);

	//column 15
	wire l3_c15carry;
	//5input
	four_two p66(level3[1][15],level3[2][15],level3[3][15],level3[4][15],l3_c16carry,level4[1][15],l3_c15carry,level4[2][14]);

	//column 14
	wire l3_c14carry;
	//5input
	four_two o66(level3[1][14],level3[2][14],level3[3][14],level3[4][14],l3_c15carry,level4[1][14],l3_c14carry,level4[2][13]);

	//column 13
	wire l3_c13carry;
	//5input
	four_two n66(level3[1][13],level3[2][13],level3[3][13],level3[4][13],l3_c14carry,level4[1][13],l3_c13carry,level4[2][12]);

	//column 12
	wire l3_c12carry;
	//5input
	four_two m66(level3[1][12],level3[2][12],level3[3][12],level3[4][12],l3_c13carry,level4[1][12],l3_c12carry,level4[2][11]);

	//column 11
	wire l3_c11carry;
	//5input
	four_two l66(level3[1][11],level3[2][11],level3[3][11],level3[4][11],l3_c12carry,level4[1][11],l3_c11carry,level4[2][10]);

	//column 10
	wire l3_c10carry;
	//5input
	four_two k66(level3[1][10],level3[2][10],level3[3][10],level3[4][10],l3_c11carry,level4[1][10],l3_c10carry,level4[2][9]);

	//column 9
	wire l3_c9carry;
	//5input
	four_two j66(level3[1][9],level3[2][9],level3[3][9],level3[4][9],l3_c10carry,level4[1][9],l3_c9carry,level4[2][8]);

	//column 8
	wire l3_c8carry;
	//5input
	four_two i66(level3[1][8],level3[2][8],level3[3][8],level3[4][8],l3_c9carry,level4[1][8],l3_c8carry,level4[2][7]);

	//column 7
	wire l3_c7carry;
	//5input
	four_two h66(level3[1][7],level3[2][7],level3[3][7],level3[4][7],l3_c8carry,level4[1][7],l3_c7carry,level4[2][6]);

	//column 6
	wire l3_c6carry;
	//5input
	four_two g66(level3[1][6],level3[2][6],level3[3][6],level3[4][6],l3_c7carry,level4[1][6],l3_c6carry,level4[2][5]);

	//column 5
	wire l3_c5carry;
	//5input
	four_two f66(level3[1][5],level3[2][5],level3[3][5],level3[4][5],l3_c6carry,level4[1][5],l3_c5carry,level4[2][4]);

	//column 4
	wire l3_c4carry;
	//5input
	four_two e66(level3[1][4],level3[2][4],level3[3][4],level3[4][4],l3_c5carry,level4[1][4],l3_c4carry,level4[2][3]);

	//column 3
	wire l3_c3carry;
	//5input
	four_two d66(level3[1][3],level3[2][3],level3[3][3],level3[4][3],l3_c4carry,level4[1][3],l3_c3carry,level4[2][2]);
		
	//col2
	fa c66(level3[1][2],level3[2][2],l3_c3carry,level4[1][2],level4[2][1]);

	//col1
	assign level4[1][1]=level3[1][1];
	
	generate
		for(i=1;i<=2;i=i+1)
			for(j=1;j<=2;j=j+1)
				assign level4[i][j]=level3[i][j];
	endgenerate

// // LEVEL 4 to 5 -----------------------------------------------------------
	//assign product=level4[1]+level4[2];
	wire cout;
	adder32bit final_add ({1'b0,level4[1]},{1'b0,level4[2]},1'b0,product,cout);
endmodule


