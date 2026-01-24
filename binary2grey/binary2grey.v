module binary2grey_df(B,GD);
input [3:0] B;
output [3:0] GD;

assign GD[3] = B[3];
assign GD[2] = B[3] ^ B[2];
assign GD[1] = B[2] ^ B[1];
assign GD[0] = B[1] ^ B[0];
endmodule

module binary2grey_st(B,GS);
input [3:0] B;
output [3:0] GS;

buf g1(GS[3],B[3]);
xor g2(GS[2],B[3],B[2]);
xor g3(GS[1],B[2],B[1]);
xor g4(GS[0],B[1],B[0]);
endmodule

module binary2grey_behav(B,GB);
input [3:0] B;
output reg [3:0] GB;

always @(B)
begin
  GB[3] = B[3];
  GB[2] = B[3] ^ B[2];
  GB[1] = B[2] ^ B[1];
  GB[0] = B[1] ^ B[0];
end
endmodule