// Designing a JK Flipflop

module jkff(clk,j,k,q,qbar);
  input clk,j,k;
  output reg q;
  output qbar;

  assign qbar = ~q;

  // always @(posedge clk)
  //   begin
  //     q <= (j & ~q) | (~k & q);
  //   end

  always @(posedge clk ) begin
    case ({j,k})
      2'b00: q <= q;
      2'b01: q <= 0;
      2'b10: q <= 1;
      2'b11: q <= ~q;
    endcase
  end
endmodule
