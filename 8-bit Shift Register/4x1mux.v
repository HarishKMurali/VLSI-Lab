module mux(s0,s1,i0,i1,i2,i3,o);
input s0,s1,i0,i1,i2,i3;
output o;

wire w0,w1,w2,w3;

and select0 (w0,~s0,~s1,i0);
and select1 (w1,s0,~s1,i1);
and select2 (w2,~s0,s1,i2);
and select3 (w3,s0,s1,i3);

or output_ (o,w0,w1,w2,w3);

endmodule