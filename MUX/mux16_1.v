// 16-to-1 Multiplexer Module using structural modeling by instantiating 4-to-1 MUX modules

module mux16_1(I,sel,out);
  input[15:0] I;
  input[3:0] sel;
  output out;

  //assign out = I[sel];
  wire w1,w2;
  mux4_1 M1(.in(I[3:0]),.sel(sel[1:0]),.out(w1));
  mux4_1 M2(.in(I[7:4]),.sel(sel[1:0]),.out(w2));
  mux4_1 M3(.in(I[11:8]),.sel(sel[1:0]),.out(w3));
  mux4_1 M4(.in(I[15:12]),.sel(sel[1:0]),.out(w4));
  mux4_1 M5(.in({w4,w3,w2,w1}),.sel(sel[3:2]),.out(out));
endmodule
