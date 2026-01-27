module absoluteValue_tb;
reg [7:0] I;
wire [7:0] Y;
wire [7:0] Y_D;

absoluteValue DUT(I,Y);
absoluteValue_df UUT(I,Y_D);

initial
begin
  I = 8'd0;
  #10 I = 8'd64;
  #10 I = -8'd4;
  #10 I = -8'd128;
  #10 I = -8'd75;
  #10 I = 8'd127;
  #10 $finish;
end
initial
begin
  $dumpfile("wave.vcd");
  $dumpvars(0,absoluteValue_tb);
  $monitor("Time =%t \t Input Number = %b \t Absolute Value Output = %b\t Absolute Value (Dataflow Ckt) = %b",$time,I,Y,Y_D);
end
endmodule