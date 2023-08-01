// Create a function that generate and return 32 values of multiple of 8 (0, 8, 16, 24, 32, 40 .... 248). Store this value in the local array of the testbench top and also print the value of each element of this array on the console.

module test();

int arr[32];

function automatic val_gen(ref int a[32]);
for(int i=0;i<32;i++)
a[i]=i*8;
endfunction

initial

begin
val_gen(arr);
for(int i=0;i<32;i++)
$display("Array arr[%0d]=%0d",i,arr[i]);
end
  
endmodule
