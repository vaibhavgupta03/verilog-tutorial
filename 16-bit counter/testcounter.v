module testcounter;
reg clk;
reg rst;
reg enable;
wire[31:0] count;

initial begin
  clk = 1'b0;
  forever #5 clk = ~clk;
end

counter16 DUT(clk,rst,enable,count);

initial begin
  $dumpfile("counter16.vcd");
  $dumpvars(0,testcounter);
  $monitor($time," count is %d and rst is %d enable is %d",count,rst,enable);
  rst = 1;
  #5 rst = 0; enable = 1;
  #200 enable = 0;
  #240 enable = 1;
  #290 rst = 1;
  #10 $finish;
end
endmodule