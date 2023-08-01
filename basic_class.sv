//Create a Class consisting of 3 data members each of unsigned integer type. Initialize them to 45,78, and 90. Use the display function to print the values on the console.
class cont;
  unsigned int b1,b2,b3;
endclass

module test();
cont c1;
initial 
begin 
    c1=new();
    c1.b1 = 45;
    c1.b2 = 78;
    c1.b3 = 90;
    $display("b1=%0d, b2=%0d, b3 =%0d",c1.b1,c1.b2,c1.b3);
end

endmodule
