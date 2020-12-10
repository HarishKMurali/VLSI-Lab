module parity_generator(input [7:0] in,output even_parity,output odd_parity);

assign even_parity=^in;
assign odd_parity=~even_parity;

endmodule

module top;
reg [7:0] a;
wire even_parity,odd_parity;

parity_generator pg(a,even_parity,odd_parity);

initial begin
	a=8'b01010111;
end
initial 
    $monitor("msg=%b   even parity bit=%b odd parity bit=%b", a, even_parity,odd_parity);
endmodule