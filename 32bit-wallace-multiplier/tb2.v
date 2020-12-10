`include "wallace.v"

module tbench;

reg [31:0] a, b;
wire reg [63:0]out;

wallace test (a, b, out);
integer i;
initial
begin
	a = 32'd2000;
	b = 32'd25;


end
initial
begin
		$monitor("a=%d\nb=%d\nout=%d", a, b,out);
end
	

endmodule