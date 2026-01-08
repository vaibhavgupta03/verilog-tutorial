// Testbench for 16-to-1 Multiplexer to verify its functionality

module test_mux;
reg[15:0]I;
reg[3:0]S;
wire O;

mux16_1 M(.I(I),.sel(S),.out(O));

initial
  begin
    $dumpfile("mux16_1.vcd");
    $dumpvars(0,test_mux);
    $monitor($time," I=%h,S=%h,O=%b",I,S,O);
    #5 I=16'h2af8; S=4'h2;
    #5 S=4'h4;
    #5 S=4'h7;
    #5 S=4'hc;
    #5 $finish;
  end 
endmodule