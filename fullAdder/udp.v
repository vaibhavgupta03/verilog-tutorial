// Full Adder design using User defined Primitives

// UDP to find sum of full adder by truth table method
primitive sum_udp(S,A,B,Cin);
  output S;
  input A,B,Cin;
  table
  //A B Cin : S
  0 0 0 : 0;
  0 0 1 : 1;
  0 1 0 : 1;
  0 1 1 : 0;
  1 0 0 : 1;
  1 0 1 : 0;
  1 1 0 : 0;
  1 1 1 : 1;
  endtable
endprimitive

// UDP to find carry out of full adder by truth table method
primitive carry_udp(Cout,A,B,Cin);
  output Cout;
  input A,B,Cin;
  table
  //A B Cin : Cout
  1 1 ? : 1;
  1 0 1 : 1;
  0 1 1 : 1;
  1 0 0 : 0;
  0 1 0 : 0;
  0 0 ? : 0;
  endtable
endprimitive