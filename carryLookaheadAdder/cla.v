module cla(a,b,cin,s,cout);
input [3:0] a,b;
input cin;
output [3:0] s;
output cout;

wire [3:0] g,p;
wire [3:0] c;

assign g = a & b;
assign p = a ^ b;

assign c[0] = cin;
assign c[1] = (c[0] & p[0]) | g[0];
assign c[2] = (c[1] & p[1]) | g[1];
assign c[3] = (c[2] & p[2]) | g[2];

assign cout = (c[0] & p[0] & p[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]) | (g[1] & p[2] & p[3]) | (g[2] & p[3]) | g[3];

assign s = p ^ c;

endmodule