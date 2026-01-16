// Designingb a 16-bit counter in Verilog with synchronous reset and enable signal

module counter16(clk,rst,enable,count);
input clk;
input rst;
input enable;
output reg[15:0] count=0;

always @(posedge clk) begin
  if(rst)
    count = 16'b0;
  else if(enable)
    count <= count+1;
end
endmodule