// 4-to-1 Multiplexer Module using structural modeling by instantiating 2-to-1 MUX modules

module mux4_1(
  in,sel,out
);
  input[3:0] in;
  input[1:0] sel;
  output out;

  //assign out = in[sel];
  wire w1,w2;

  mux2_1 M1(.in(in[1:0]),.sel(sel[0]),.out(w1));
  mux2_1 M2(.in(in[3:2]),.sel(sel[0]),.out(w2));
  mux2_1 M3(.in({w2,w1}),.sel(sel[1]),.out(out));
endmodule