//merge
module blackcell(	input g_in1,	input p_in1,	input g_in2,	input p_in2,	output g_out,	output p_out);
	
	wire w;
	
	assign w=p_in1&g_in2;
	assign g_out=w|g_in1;
	
	assign p_out=p_in1&p_in2;

endmodule

//feedthrough
module greycell(	input g_in1,	input p_in1,	input g_in2,	output g_out);
	
	wire w;
	
	assign w=p_in1&g_in2;
	assign g_out=w|g_in1;

endmodule