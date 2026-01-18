module ha_behavioral(a,b,s_behav,c_behav);
input a,b;
output reg s_behav,c_behav;

always @(*) begin
  case({a,b})
    2'b00 : {s_behav,c_behav} = 2'b00;
    2'b01 : {s_behav,c_behav} = 2'b10;
    2'b10 : {s_behav,c_behav} = 2'b10;
    2'b11 : {s_behav,c_behav} = 2'b01;
  endcase
end
endmodule