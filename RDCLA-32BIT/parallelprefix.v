module parallelprefix(X, Y, Z);
    input [1:0] X, Y;
    output reg [1:0] Z;

    always@(X, Y) begin
        if (X == 2'b00 || X == 2'b11)
            assign Z = X;
        else
            assign Z = Y;
    end
endmodule