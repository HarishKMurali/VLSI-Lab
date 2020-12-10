`include "rdcla32.v"
module rdcla32_tb;
reg [31:0] a, b;
reg cin;
wire [31:0] sum;
wire cout;

rdcla rdcla0(sum, cout, a, b, cin);
initial begin
		cin=1'b0;
    a = 32'd25;
    b = 32'd76;
end
initial 
    $monitor("A = %d, B = %d,cin= %b, Sum = %d, cout = %d", a, b,cin, sum, cout);
endmodule