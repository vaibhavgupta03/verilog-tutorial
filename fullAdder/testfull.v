// Testbench for full adder module to verify its functionality 

module testbench;
reg A,B,Cin;
wire S,Cout;

fulladder2 DUT(A,B,Cin,S,Cout);

initial
  begin
    $dumpfile("example.vcd");
    $dumpvars(0,testbench);

    $monitor($time," A=%b,B=%b,Cin=%b,S=%b,Cout=%b",A,B,Cin,S,Cout);
    
    #5 A=0; B=0;Cin=0;
    #5 A=0; B=0;Cin=1;
    #5 A=0; B=1;Cin=0;
    #5 A=0; B=1;Cin=1;
    #5 A=1; B=0;Cin=0;
    #5 A=1; B=0;Cin=1;
    #5 A=1; B=1;Cin=0;
    #5 A=1; B=1;Cin=1;
    #5 $finish;
  end
endmodule