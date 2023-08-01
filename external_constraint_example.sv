//For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, variable b ranges from 0 to 5. Also, add logic to store the number of times randomization failed. Print values of variables during each iteration and error count after generating 20 random values for a and b. Add Constraint Code and Testbench top code to  the Design.
class generator;
 randc bit [4:0] a;
 randc bit [5:0] b;
 
 extern constraint data;
endclass

constraint generator::data {
  a inside {[0:8]};
  b inside {[0:5]};
}

module test();
generator g1;
int i, count=0;

initial 
begin 
    for (i=0;i<12;i++)
    begin
    g1 = new();
    if(!(g1.randomize()))
        begin
           count=count+1;
           $display("randomization failed at time %0t",$time);
        end
    $display("Value of a=%0d,b=%0d",g1.a,g1.b);
    end
    $display("No of times randomization failed=%0d",count);
end
endmodule
