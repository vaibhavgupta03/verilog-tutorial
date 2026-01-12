module jkff2 (q,qbar,clk,j,k,preset,clear);
input clk,j,k,preset,clear;
output reg q;
output qbar;

assign qbar = ~q;

always @(negedge clk)
  begin
    if(preset == 0 && clear == 1) q<=1;
    else if(clear == 0 && preset == 1) q<=0;
    else if(preset==0 && clear==0) q<=1'bx;
    else begin
      case ({j,k})
        2'b00: q<=q;
        2'b01: q<=0;
        2'b10: q<=1;
        2'b11: q<=~q;
      endcase
    end
  end
endmodule
