module binary2grey_tb;
reg [3:0] B;
wire [3:0] GD, GS, GB;

binary2grey_st DUT1(B,GS);
binary2grey_df DUT2(B,GD);
binary2grey_behav DUT3(B,GB);

initial
begin
  $dumpfile("binary2grey.vcd");
  $dumpvars(0,binary2grey_tb);
  $monitor($time," Binary = %b | Grey_struct = %b | Grey_df = %b | Grey_behav = %b",B,GS,GD,GB);
  B = 4'b1001;
  #10 B = 4'b1000;
  #10 B = 4'b1010;
  #10 $finish;
end
endmodule