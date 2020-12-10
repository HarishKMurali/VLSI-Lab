`include "8bitSR.v"

module top;
reg [7:0] p_in;
reg clk,s0,s1,shiftleft_input,shiftright_input;
wire [7:0] out;

initial clk=1'b1;
always #5 clk=~clk;

eightbitSR eightbitSR0 (clk,s0,s1,p_in,shiftleft_input,shiftright_input,out);

initial
begin
    p_in = 8'b11111111;s1=1;s0=1;

    #10 shiftright_input=1'b0;s1=0;s0=1;

    #40 shiftleft_input=1'b1;s1=1;s0=0;

    #80 p_in=8'b10101010;s0=1;s1=1;

    #10 s0=0;s1=0;

    #30 p_in=8'b11001100; s0=1;s1=1;
end

initial

begin
    $monitor($time," out = %b",out);
    //$monitor($time,"  s1=%b s0=%b out = %b",s1,s0,out);
    $dumpfile("8bitSR.vcd");
	$dumpvars;
    #300 $finish;
end

endmodule
