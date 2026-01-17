module testcounter;
reg clk;
reg rst;
reg enable;
reg mode;
wire[15:0] count;

initial begin
  clk = 1'b0;
  forever #5 clk = ~clk;
end

counter16 DUT(clk,rst,enable,count,mode);

initial begin
  $dumpfile("counter16.vcd");
  $dumpvars(0,testcounter);
  $monitor($time," count is %d and rst is %d enable is %d mode is %d",count,rst,enable,mode);
  rst = 1; enable = 0; mode = 0; // start with up counting
  #5 rst = 0; enable = 1;
  #90 enable = 0;
  #20 mode = 1; // switch to down counting
  #40 enable = 1;
  #40 rst = 1;
  #10 $finish;
end
endmodule