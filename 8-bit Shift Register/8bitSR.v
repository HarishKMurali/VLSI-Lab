`include "4bitSR.v"

module eightbitSR(clk,s0,s1,p_in,shiftleft_input,shiftright_input,out);
input  [7:0] p_in;
input clk,s0,s1,shiftleft_input,shiftright_input;
output [7:0] out;

fourbitSR fourbitSR0(clk,s0,s1,p_in[3:0],shiftleft_input,out[4],out[3:0]);
fourbitSR fourbitSR1(clk,s0,s1,p_in[7:4],out[3],shiftright_input,out[7:4]);

endmodule