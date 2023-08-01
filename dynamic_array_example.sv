//Create a dynamic array capable of storing 7 elements. add a value of multiple of 7 starting from 7 in the array (7, 14, 21 ....49). After 20 nsec Update the size of the dynamic array to 20. Keep existing values of the array as it is and update the rest 13 elements to a multiple of 5 starting from 5. Print Value of the dynamic array after updating all the elements.

//Expected result : 7, 14, 21, 28 ..... 49, 5, 10, 15 ..... 65 .

module test();
  int i;
  int arr[];
  initial 
  begin
  arr = new[7];
  for(i=0;i<7;i++)
  begin
  arr[i]=(i+1)*7;
  end
  #20
  arr = new[20](arr);
  for(int j=1;j<14;j++)
  begin
  arr[i]=5*j;
  i++;
  end  
  
  $display("Contents of arr = %0p",arr);
  end   
endmodule
