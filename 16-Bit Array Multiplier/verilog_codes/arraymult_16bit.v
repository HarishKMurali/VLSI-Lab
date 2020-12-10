module fulladder (a, b, cin, sum, ca);
input a, b, cin;
output sum, ca;

assign sum = a ^ b ^ cin;
assign ca = (a & b) | (a & cin) | (b & cin);

endmodule

module halfadder(a,b,sum,ca);
input a,b;
output sum,ca;

assign sum=a^b;
assign ca=a&b;

endmodule

 
module arraymult_16bit(
    input [15:0] a,
    input [15:0] b,
    output [31:0] product
    );

	wire [15:0]pp0;
	wire [16:1]pp1;
	wire [17:2]pp2;
	wire [18:3]pp3;
	wire [19:4]pp4;
	wire [20:5]pp5;
	wire [21:6]pp6;
	wire [22:7]pp7;
	wire [23:8]pp8;
	wire [24:9]pp9;
	wire [25:10]pp10;
	wire [26:11]pp11;
	wire [27:12]pp12;
	wire [28:13]pp13;
	wire [29:14]pp14;
	wire [30:15]pp15;

	genvar i;
	generate
		for(i=0;i<16;i=i+1)
		begin
			assign pp0[i+0]=a[i]&b[0];
			assign pp1[i+1]=a[i]&b[1];
			assign pp2[i+2]=a[i]&b[2];
			assign pp3[i+3]=a[i]&b[3];
			assign pp4[i+4]=a[i]&b[4];
			assign pp5[i+5]=a[i]&b[5];
			assign pp6[i+6]=a[i]&b[6];
			assign pp7[i+7]=a[i]&b[7];
			assign pp8[i+8]=a[i]&b[8];
			assign pp9[i+9]=a[i]&b[9];
			assign pp10[i+10]=a[i]&b[10];
			assign pp11[i+11]=a[i]&b[11];
			assign pp12[i+12]=a[i]&b[12];
			assign pp13[i+13]=a[i]&b[13];
			assign pp14[i+14]=a[i]&b[14];
			assign pp15[i+15]=a[i]&b[15];
		end
	endgenerate

	// 1 - initial
	wire [15:1]sum1;
	wire [15:1]carry1;
	assign product[0]=pp0[0];
	halfadder until_1[15:1] (pp0[15:1],pp1[15:1],sum1[15:1],carry1[15:1]);
	
	// until 2
	wire [16:2]sum2;
	wire [16:2]carry2;
	assign product[1]=sum1[1];
	fulladder until_2[16:2] ({pp1[16],sum1[15:2]},carry1[15:1],pp2[16:2],sum2[16:2],carry2[16:2]);

	// until 3
	wire [17:3]sum3;
	wire [17:3]carry3;
	assign product[2]=sum2[2];
	fulladder until_3[17:3] ({pp2[17],sum2[16:3]},carry2[16:2],pp3[17:3],sum3[17:3],carry3[17:3]);

	// until 4
	wire [18:4]sum4;
	wire [18:4]carry4;
	assign product[3]=sum3[3];
	fulladder until_4[18:4] ({pp3[18],sum3[17:4]},carry3[17:3],pp4[18:4],sum4[18:4],carry4[18:4]);

	// until 5
	wire [19:5]sum5;
	wire [19:5]carry5;
	assign product[4]=sum4[4];
	fulladder until_5[19:5] ({pp4[19],sum4[18:5]},carry4[18:4],pp5[19:5],sum5[19:5],carry5[19:5]);

	// until 6
	wire [20:6]sum6;
	wire [20:6]carry6;
	assign product[5]=sum5[5];
	fulladder until_6[20:6] ({pp5[20],sum5[19:6]},carry5[19:5],pp6[20:6],sum6[20:6],carry6[20:6]);

	// until 7
	wire [21:7]sum7;
	wire [21:7]carry7;
	assign product[6]=sum6[6];
	fulladder until_7[21:7] ({pp6[21],sum6[20:7]},carry6[20:6],pp7[21:7],sum7[21:7],carry7[21:7]);

	// until 8
	wire [22:8]sum8;
	wire [22:8]carry8;
	assign product[7]=sum7[7];
	fulladder until_8[22:8] ({pp7[22],sum7[21:8]},carry7[21:7],pp8[22:8],sum8[22:8],carry8[22:8]);

	// until 9
	wire [23:9]sum9;
	wire [23:9]carry9;
	assign product[8]=sum8[8];
	fulladder until_9[23:9] ({pp8[23],sum8[22:9]},carry8[22:8],pp9[23:9],sum9[23:9],carry9[23:9]);

	// until 10
	wire [24:10]sum10;
	wire [24:10]carry10;
	assign product[9]=sum9[9];
	fulladder until_10[24:10] ({pp9[24],sum9[23:10]},carry9[23:9],pp10[24:10],sum10[24:10],carry10[24:10]);

	// until 11
	wire [25:11]sum11;
	wire [25:11]carry11;
	assign product[10]=sum10[10];
	fulladder until_11[25:11] ({pp10[25],sum10[24:11]},carry10[24:10],pp11[25:11],sum11[25:11],carry11[25:11]);

	// until 12
	wire [26:12]sum12;
	wire [26:12]carry12;
	assign product[11]=sum11[11];
	fulladder until_12[26:12] ({pp11[26],sum11[25:12]},carry11[25:11],pp12[26:12],sum12[26:12],carry12[26:12]);

	// until 13
	wire [27:13]sum13;
	wire [27:13]carry13;
	assign product[12]=sum12[12];
	fulladder until_13[27:13] ({pp12[27],sum12[26:13]},carry12[26:12],pp13[27:13],sum13[27:13],carry13[27:13]);

	// until 14
	wire [28:14]sum14;
	wire [28:14]carry14;
	assign product[13]=sum13[13];
	fulladder until_14[28:14] ({pp13[28],sum13[27:14]},carry13[27:13],pp14[28:14],sum14[28:14],carry14[28:14]);

	// until 15
	wire [29:15]sum15;
	wire [29:15]carry15;
	assign product[14]=sum14[14];
	fulladder until_15[29:15] ({pp14[29],sum14[28:15]},carry14[28:14],pp15[29:15],sum15[29:15],carry15[29:15]);

	// until 16 - final
	wire [30:16]carry16;
	assign product[15]=sum15[15];
	halfadder add16 (sum15[16],carry15[15],product[16],carry16[16]);
	fulladder until_16[30:17] ({pp15[30],sum15[29:17]},carry15[29:16],carry16[29:16],product[30:17],carry16[30:17]);
	assign product[31]=carry16[30];

endmodule

module top;
reg [15:0] a,b;
wire [31:0] product;

arraymult_16bit mul(a,b,product);

initial begin
	a=16'd15;
	b=16'd30;
end
initial 
    $monitor("a=%d  b=%d product=%d", a, b,product);
endmodule