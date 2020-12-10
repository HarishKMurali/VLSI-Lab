module partial_products (
	input [31:0]a,
	input [31:0]b,
	output reg [31:0][63:0]p_prods
);

	integer i;

	always @(a or b)
	begin
		for(i=0; i<32; i=i+1)begin
			p_prods = 64'h00000000;
			if(b[i] == 1)begin
				p_prods[i] <= a<<i;//if multiplicant digit is 1 a is the partial product else 0
			end
		end
	end

endmodule