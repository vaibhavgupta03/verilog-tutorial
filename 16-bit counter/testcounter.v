module testcounter;
reg clk;
reg rst;
wire[31:0] count;

initial begin
  clk = 1'b0;
  forever #5 clk = ~clk;
end

counter16 DUT(clk,rst,count);

initial begin
  $dumpfile("counter16.vcd");
  $dumpvars(0,testcounter);
  $monitor($time," count is %d and rst is %d",count,rst);
  rst = 1;
  #5 rst = 0;
  #290 rst = 1;
  #10 $finish;
end
endmodule