// Designing a 16-bit counter in Verilog with synchronous reset and enable signal and adding a mode for counting up or down

module counter16(clk,rst,enable,count,mode);
input clk;
input rst;
input enable;
input mode; // mode=0 for up counting, mode=1 for down counting
output reg[15:0] count=0;

always @(posedge clk) begin
  if(rst)
    count = 16'b0;
  else if(enable)
    count <= mode ? count-1 : count+1;
end
endmodule