// Testbech for verifying output of jk ff

module test_jk;
  reg j,k,clk,preset,clear;
  wire q;

  jkff DUT(q, clk, j, k, preset, clear);

  initial clk = 1'b0;

  always #5 clk = ~clk;

  initial
    begin
      $dumpfile("jk_ff.vcd");
      $dumpvars(0,test_jk);
      $monitor($time," j=%b, k=%b | q=%b, qbar=%b",j,k,q,qbar);
      j = 0 ; k = 0;
      #15 j=1; k=0;
      #10 j=0; k=0;
      #10 j=0; k=1;
      #10 j=1; k=1;
      #20 $finish;
    end
endmodule