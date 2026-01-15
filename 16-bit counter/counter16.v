// Designingb a 16-bit counter in Verilog with synchronous reset

module counter16(clk,rst,count);
input clk;
input rst;
output reg[31:0] count=0;

always @(posedge clk) begin
  if(rst)
    count = 32'b0;
  else
    count = count+1;
end
endmodule