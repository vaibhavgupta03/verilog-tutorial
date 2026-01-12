// Testbech for verifying output of jk ff

`timescale 1ns/1ps

module testjkff2;
reg clk;
reg j;
reg k;
reg preset;
reg clear;
wire q;
wire qbar;

jkff2 DUT(q,qbar,clk,j,k,preset,clear);

initial
  begin
    clk = 1'b0;
    forever #5 clk = ~ clk;
  end

initial 
  begin
    $dumpfile("jkff2.vcd");
    $dumpvars(0,testjkff2);

    $monitor($time," preset = %b , clear = %b , j=%b , k = %b | q = %b | qbar=%b",preset,clear,j,k,q,qbar);
    #10 preset =0; clear =1;
    #10 preset = 1; clear=0;
    #10 preset = 1; clear = 1; j=1; k=1;
    #10 preset = 1; clear = 1; j=1; k=0;
    #10 preset = 1; clear = 1; j=0; k=0;
    #10 preset = 1; clear = 1; j=0; k=1;
    #10 preset = 1; clear = 1; j=1; k=1;
    #20 $finish;
  end
endmodule