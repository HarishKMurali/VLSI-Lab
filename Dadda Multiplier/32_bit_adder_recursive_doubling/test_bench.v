`include "fast_adder.v"

module top;

    reg [31:0] a,b;
    reg cin;
    wire [31:0]sum;
    wire cout;

    adder32bit add (a,b,cin,sum,cout);

    initial
    begin
        cin=1'b0;a=32'd10;b=32'd10;
        #5 a=32'd200;
        #5 cin=1'b1;b=32'd750;
        #5 a=32'd1234;
        #5 cin=1'b0;b=32'd5678;
        #5 a=32'hffffffff; b=32'd55;
        #5;
    end

    initial

    begin
        // $monitor($time,"  a = %b, b = %b, cin = %b sum = %b, cout = %b",a,b,cin,sum,cout);
        $monitor($time,"  a = %d, b = %d, cin = %d sum = %d, cout = %d",a,b,cin,sum,cout);
        $dumpfile("adder.vcd");
        $dumpvars;
    end

endmodule
