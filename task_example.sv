// Create a task that will generate stimulus for addr , wr, and en signal as mentioned in a waveform of the Instruction tab. Assume address is 6-bit wide while en and wr both are 1-bit wide. The stimulus should be sent on a positive edge of 25 MHz clock signal.
`timescale 1ns / 1ps

module test();

bit en,wr;
bit [5:0]addr;
bit clk =0;
  
always  #20 clk=~clk;
task stim_clk();

@(posedge clk);
en=1;
wr=1;
addr=12;
#40
addr=14;
#40
wr=0;
addr=23;
#40
addr=48;
#40
addr=56;
en=0;
#40
$finish;   
endtask

initial begin
stim_clk();
end

endmodule
