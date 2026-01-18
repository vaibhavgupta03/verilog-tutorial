module ha_tb;
reg a,b;
wire s,c; // dflow outputs
wire s_struct, c_struct; // structural outputs
wire s_behav, c_behav; // behavioral outputs

ha_dflow DUT_dflow (a,b,s,c);
ha_structural DUT_struct (a,b,s_struct,c_struct);
ha_behavioral DUT_behav (a,b,s_behav,c_behav);

initial
  begin
    $dumpfile("ha.vcd");
    $dumpvars(0,ha_tb);
    $monitor($time," a = %b , b = %b | dflow: s=%b,c=%b | struct: s=%b,c=%b | behav: s=%b,c=%b",a,b,s,c,s_struct,c_struct,s_behav,c_behav);
    #5 a = 0; b= 0;
    #5 a = 0; b=1;
    #5 a=1; b=0;
    #5 a=1; b=1;
    #10 $finish;
  end

endmodule
