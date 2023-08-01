//Take the help of pseudo-random number generator to generate values for wr and rst signal. rst should be low for apprx. 30% of time whie wr should be high for apprx. 50% of time. Verify your code for 20 iterations by sending values of both wr and rst on a console.
generator g1;
class generator;
 rand bit rst;
 rand bit wr;
 
 constraint data {
  rst dist {0:/30, 1:/70};
  wr dist {0:/50, 1:/50};
 }
endclass
module test();
initial 
begin 
  g1 = new();
  for (int i=0;i<20;i++)
  begin
  g1.randomize();
  $display("Value of rst:%0d, wr:%0d",g1.rst,g1.wr);
  end
end
endmodule
