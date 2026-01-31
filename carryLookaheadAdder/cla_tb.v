module cla_tb;
reg [3:0] a,b;
reg cin;
wire [3:0] s;
wire cout;

cla UUT(a,b,cin,s,cout);

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0,cla_tb);
  $monitor("Time = %0t | a = %b | b = %b | sum = %b | cout = %b",$time,a,b,s,cout);
  a = 3'b0; b = 3'b0; cin = 1'b0;
  #100;

  #10 a = 4'b1101; b = 4'b0001;
  #10 a = 4'b0110; b = 4'b0011;
  #10 a = 4'b1110; b = 4'b1011;
  #10 $finish;
end

endmodule