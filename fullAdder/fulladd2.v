// Full Adder by instatiating basic gates (structural modeling)

module fulladder2(A,B,Cin,S,Cout);
 input A,B,Cin;
 output S,Cout;

 wire w1,w2,w3;
 
 xor x1(w1,A,B);
 and a1(w2,A,B);
 xor x2(S,w1,Cin);
 and a2(w3,Cin,w1);
 or o1(Cout,w2,w3);
endmodule