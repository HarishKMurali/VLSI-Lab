module adder32bit (a,b,cin,sum,cout);

	input [31:0] a, b;
	input cin;
	output reg [31:0] sum;
	output reg cout;
	reg [31:0] partial_sum;

	wire [32:0] carry, p, carry_1, p_1, carry_2, p_2, carry_4, p_4, carry_8, p_8, carry_16, p_16;
	
	assign carry[0] = cin;
	assign p[0] = 0;
	
	kpg_init initializing_kpg [32:1] (a[31:0], b[31:0], p[32:1], carry[32:1]);

	assign p_1[0] = cin;
	assign carry_1[0] = cin;
	assign p_2[1:0] = p_1[1:0];
	assign carry_2[1:0] = carry_1[1:0];
	assign p_4[3:0] = p_2[3:0];
	assign carry_4[3:0] = carry_2[3:0];
	assign p_8[7:0] = p_4[7:0];
	assign carry_8[7:0] = carry_4[7:0];
	assign p_16[15:0] = p_8[15:0];
	assign carry_16[15:0] = carry_8[15:0];

	kpg iteration_1 [32:1] (p[32:1], carry[32:1], p[31:0], carry[31:0], p_1[32:1], carry_1[32:1]);
	kpg iteration_2 [32:2] (p_1[32:2], carry_1[32:2], p_1[30:0], carry_1[30:0], p_2[32:2], carry_2[32:2]);
	kpg iteration_4 [32:4] (p_2[32:4], carry_2[32:4], p_2[28:0], carry_2[28:0], p_4[32:4], carry_4[32:4]);
	kpg iteration_8 [32:8] (p_4[32:8], carry_4[32:8], p_4[24:0], carry_4[24:0], p_8[32:8], carry_8[32:8]);
	kpg iteration_16 [32:16] (p_8[32:16], carry_8[32:16], p_8[16:0], carry_8[16:0], p_16[32:16], carry_16[32:16]);

	always @(*)
	begin
		partial_sum = a^b;
		sum = partial_sum[31:0]^carry_16[31:0];
		cout = carry_16[32];
	end

endmodule

module kpg_init (
	input a, b,
	output reg p, carry
);
	always @*
	case ({a, b})
		2'b00: begin
			p = 1'b0; carry = 1'b0;
		end
		2'b11: begin
			p = 1'b0; carry = 1'b1;
		end
		default: begin 
			p = 1'b1; carry = 1'bx;
		end
	endcase

endmodule

module kpg (
	input current_p, current_carry, from_p, from_carry,
	output reg final_p, final_carry
);
	always @(*)
	begin
	
		if({current_p, current_carry} == 2'b00)
			{final_p, final_carry} = 2'b00;
		
		else if({current_p, current_carry} == 2'b01)
			{final_p, final_carry} = 2'b01;

		else
			{final_p, final_carry} = {from_p, from_carry};

	end

endmodule