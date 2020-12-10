`include"dadda.v"

module top;

    reg [15:0] a,b;
    wire [31:0]product;
    reg [31:0]pd;

    dadda mult (a,b,product);

    always @*
        pd=a*b;

    initial
    begin
        $dumpfile("dadda.vcd");
		$dumpvars;
		
        $monitor("%t   dadda: %d    multiplication: %d",$time,product,pd);
        a=16'd25;b=16'd8;
        #5 a=16'd1642;b=16'd166;
        #5 a=16'hf;b=16'haa;
        #5 a=16'd187;b=16'd82;
        #5 a=16'd0;b=16'd6587;
    end

endmodule
