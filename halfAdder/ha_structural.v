module ha_structural(a,b,s_struct,c_struct);
input a,b;
output s_struct,c_struct;

xor(s_struct,a,b);
and(c_struct,a,b);

endmodule