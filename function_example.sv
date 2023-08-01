//Create a function that will perform the multiplication of the two unsigned integer variables. Compare values return by function with the expected result and if both values match send "Test Passed" to Console else send "Test Failed".

module test();

function int mult(input int a,b);
return a*b;
endfunction

int a=4;
int b=5;
int res;

initial
begin

  res = mult(a,b);

  if(res==20)
  $display("Test passed!Result=%0d",res);
  else
  $display("Test Failed!Result=%0d",res);
end

endmodule
