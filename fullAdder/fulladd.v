// Full Adder using standard gates and UDPs
module fulladder(A,B,Cin,S,Cout);
  input A,B,Cin;
  output S,Cout;

  // Logic design of full adder using basic gates
  /*assign S = A ^ B ^ Cin;
  assign Cout = (Cin & (A ^ B)) | (A & B);*/

  // Using UDPs to design full adder by instantiating the UDPs for sum and carry out
  sum_udp u_sum(S,A,B,Cin);
  carry_udp u_cout(Cout,A,B,Cin);
endmodule