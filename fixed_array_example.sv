//Create two arrays of reg type capable of storing 15 elements. Use $urandom function to add 15 values to the array. Print the value of all the elements of the array on a single line.
module test();
int i=0;
 reg arr1[15];
 reg arr2[15];
 initial 
 begin
 repeat(15)
 begin
 arr1[i]='{$urandom()};
 arr2[i]='{$urandom()};
 i++;
 end
 $display("All elements of arr1= %0p",arr1);
 $display("All elements of arr2= %0p",arr2);
 end  
endmodule
