//Generate values between 0 to 7 for addr signal when wr is high and values between 8 to 15 when wr is low. Generator code is mentioned in the Instruction tab. Verify your code for 20 iterations by sending values of both wr and addr on a console.
class generator;
 rand bit [3:0] addr;
 rand bit wr;
 
 constraint addr_wr {
   (wr==1) -> (addr inside {[0:7]});
   (wr==0) -> (addr inside {[8:15]});
 }
endclass
module test();
generator g;      
initial 
begin 

g = new();
for(int i=0;i<20;i++)
    begin
    g.randomize();
    $display("Values of wr:%0d and addr:%0d",g.wr,g.addr);
    end
end                                      
endmodule
