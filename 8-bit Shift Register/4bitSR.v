`include "dflipflop.v"
`include "4x1mux.v"

module fourbitSR(clk,s0,s1,p_in,shiftleft_input,shiftright_input,out);
input  [3:0] p_in;
input clk,s0,s1,shiftleft_input,shiftright_input;
output [3:0] out;
wire d[3:0];
wire negout[3:0];

mux mux0 (s0,s1,out[0],out[1],shiftleft_input,p_in[0],d[0]);
mux mux1 (s0,s1,out[1],out[2],out[0],p_in[1],d[1]);
mux mux2 (s0,s1,out[2],out[3],out[1],p_in[2],d[2]);
mux mux3 (s0,s1,out[3],shiftright_input,out[2],p_in[3],d[3]);

dff dff0 (d[0],clk,out[0],negout[0]);
dff dff1 (d[1],clk,out[1],negout[1]);
dff dff2 (d[2],clk,out[2],negout[2]);
dff dff3 (d[3],clk,out[3],negout[3]);

endmodule