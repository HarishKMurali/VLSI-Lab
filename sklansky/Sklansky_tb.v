`include "Sklansky_Adder_16_bit.v"

module top;
	reg [15:0] a,b;
	reg C_in;
	wire [15:0] sum;
	wire C_out;
	sklansky add1(a,b,C_in,sum,C_out);
	
	initial
  begin
		$monitor("A: %d B: %d Cin: %d Sum: %d Cout: %d",a,b,C_in,sum,C_out);
		a=16'd95;b=16'd80;C_in=1'b0;
    #5 a=16'd164;b=16'd196;C_in=1'b0;
	end
endmodule