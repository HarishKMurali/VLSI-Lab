module ha(a,b,sum,cout);
	input a,b;
	output sum,cout;

	assign sum=a^b;
	assign cout=a&b;

endmodule

module fa(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;

	assign sum=a^b^cin;
	assign cout=(a&b)|(b&cin)|(cin&a);

endmodule

module four_two(x1,x2,x3,x4,cin,sum,carry,cout);
	input x1,x2,x3,x4,cin;
	output sum,carry,cout;

	wire w;
	fa fa1(x1,x2,x3,w,cout);
	fa fa2(w,x4,cin,sum,carry);

endmodule