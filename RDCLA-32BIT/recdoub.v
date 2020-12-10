`include "parallelprefix.v"
module recdoub32bit(a, b, Sum, cout);
    input [31:0] a, b;
    output [31:0] Sum;
    output cout;
    wire [63:0] kpg, kpg1, kpg2, kpg3, kpg4, kpg5;
    wire [31:0] xor_sum, carry;
    
 		//k=00 p=01,10 g=11
		genvar j;
		generate
			for(j=0;j<=31;j=j+1) begin
				assign kpg[2*j]=a[j];
				assign kpg[2*j+1]=b[j];
			end
		endgenerate

		assign	xor_sum=a^b;  //sum without considering carry

		
		parallelprefix mod1[31:1](kpg[63:2],kpg[61:0],kpg1[63:2]);  //step-1 each bit combined with next bit
		parallelprefix mod1a(kpg[1:0],2'b00, kpg1[1:0]);						//as 0 bit has no adjacent bit it is combined with 00

		parallelprefix mod2[31:2](kpg1[63:4], kpg1[59:0], kpg2[63:4]); //step-2 each bit combined with second bit
		parallelprefix mod2a[1:0](kpg1[3:0],2'b00, kpg2[3:0]);

		parallelprefix mod3[31:4](kpg2[63:8], kpg2[55:0], kpg3[63:8]); //step-3 each bit combined with fourth bit
		parallelprefix mod3a[3:0](kpg2[7:0], 2'b00, kpg3[7:0]);

		parallelprefix mod4[31:8](kpg3[63:16], kpg3[47:0], kpg4[63:16]);//step-4 each bit combined with eighth bit
		parallelprefix mod4a[7:0](kpg3[15:0], 2'b00, kpg4[15:0]);

		parallelprefix mod5[31:16](kpg4[63:32], kpg4[31:0], kpg5[63:32]);//step-5 each bit combined with sixteenth bit
		parallelprefix mod5a[15:0](kpg4[31:0], 2'b00, kpg5[31:0]);
		

	
		generate
			for(j=0;j<=31;j=j+1) begin
				assign carry[j]=kpg5[2*j+1:2*j+1]; //converting kgp to carry
			end
		endgenerate 

 		assign Sum[0] = xor_sum[0];
		assign Sum[31:1]=xor_sum[31:1]^carry[30:0];//xoring carry with already calculated xor_sum
		assign cout = carry[31];

endmodule