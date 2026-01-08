// 2-to-1 Multiplexer Module using dataflow modeling

module mux2_1(
  in,sel,out
);
  input[1:0] in;
  input sel;
  output out;

  assign out = in[sel];
endmodule