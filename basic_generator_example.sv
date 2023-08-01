//Assume generator class consists of three 8-bit data members (x,y, and z). Write a code to generate 20 random values for all the data members at an interval of 20 ns.

class generator;

randc bit [7:0] x,y,z;

endclass



module test();

generator g1;

initial

begin

  for(int i=0;i<20;i++)

  begin 

  g1 = new();

  g1.randomize();

  $display("Value of x :%0d ,y: %0d, z: %0d", g1.x,g1.y,g1.z);

  #20;

  end

end

endmodule
