// Testbench for full adder module to verify its functionality 

module testbench;
reg A,B,Cin;
wire S,Cout;
reg correct;

fulladder2 DUT(A,B,Cin,S,Cout);

initial
  begin

    correct = 1;

    #5 A=0; B=0;Cin=0; #5;
      if((S!=0) || (Cout != 0))
        correct = 0;
    #5 A=0; B=0;Cin=1; #5;
      if((S!=1) || (Cout != 0))
        correct = 0;
    #5 A=0; B=1;Cin=0; #5;
      if((S!=1) || (Cout != 0))
        correct = 0;
    #5 A=0; B=1;Cin=1; #5;
      if((S!=0) || (Cout != 1))
        correct = 0;
    #5 A=1; B=0;Cin=0; #5;
      if((S!=1) || (Cout != 0))
        correct = 0;
    #5 A=1; B=0;Cin=1; #5;
      if((S!=0) || (Cout != 1))
        correct = 0;
    #5 A=1; B=1;Cin=0; #5;
      if((S!=0) || (Cout != 1))
        correct = 0;
    #5 A=1; B=1;Cin=1; #5;
      if((S!=1) || (Cout != 1))
        correct = 0;
    #5 $display("Output is %d",correct);
    #5 $finish;
  end
// initial
//   begin
//     $dumpfile("example.vcd");
//     $dumpvars(0,testbench);
//     $monitor("t=%0t A=%b,B=%b,Cin=%b || S=%b Cout=%b",$time,A,B,Cin,S,Cout);
//   end
endmodule