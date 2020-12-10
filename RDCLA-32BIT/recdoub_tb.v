`include "recdoub.v"
module rec_doub_cla16bittb;
reg [31:0] a, b;
wire [31:0] Sum;
wire cout;

recdoub32bit moda(a, b, Sum, cout);
initial begin
    a = 32'd79;
    b = 32'd76;
end
initial 
    $monitor("A = %d, B = %d, Sum = %d, cout = %d", a, b, Sum, cout);
endmodule