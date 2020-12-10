module FA (
	input [63:0] x,
	input [63:0] y,
	input [63:0] z,
	output [63:0]u,
	output [63:0]v);

// assign {v, u} = x+y+z;
assign u = x^y^z;//sum
assign v = ((x&y) | (y&z) | (z&x))<<1; //carry (left shifted once)


endmodule