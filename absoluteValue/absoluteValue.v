module absoluteValue(I,Y);
input [7:0] I;
output reg [7:0] Y;


always @(*)
begin
  if (I[7] == 0) Y = I;
  else if (I[7] == 1)
  begin
    Y = (~I) + 1;
  end
  else Y = 8'bx;
end
endmodule

module absoluteValue_df(I,Y_D);
input signed [7:0] I;
output signed [7:0]Y_D;

assign Y_D = I > 0 ? I : -I;
endmodule