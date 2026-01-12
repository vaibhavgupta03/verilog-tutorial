primitive jkff2 (q, clk, j, k, preset, clear);
  output q;
  reg    q;
  input  clk, j, k, preset, clear;

  table
    //clk j k preset clear : q : q_n
    ? ? ? 1 0 : ? : 0;
    ? ? ? 0 1 : ? : 1;
    F 0 0 1 1 : ? : -;
    F 0 1 1 1 : ? : 0;
    F 1 0 1 1 : ? : 1;
    F 1 1 1 1 : 0 : 1;
    F 1 1 1 1 : 1 : 0;
    R ? ? 1 1 : ? : -; 
  endtable
endprimitive