// Create a Fixed-size array capable of storing 20 elements. Add random values to all the 20 elements by using $urandom function. Now add all the elements of the fixed-size array to the Queue in such a way that the first element of the Fixed-size array should be the last element of the Queue. Print all the elements of both fixed-size array and Queue on Console.

module test();
int i;
int que[$];
int arr[20];
initial 
begin 
for(i=0;i<20;i++)
arr[i]={$urandom()};
 
for(i=0;i<20;i++)
que.push_front(arr[i]);
 
$display("Array= %0p", arr);
$display("Queue= %0p", que);
 
end

endmodule
