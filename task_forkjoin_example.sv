//Create two tasks each capable of sending a message to Console at a fixed interval. Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable for keeping the track of task execution and incrementing with each trigger. Execute both tasks in parallel till 200 nsec. Display the number of times Task 1 and Task 2 executed after 200 ns before calling $finish for stopping the simulation.

module test();
int c1,c2=0;
event done;

task task1();
     
     forever
     begin
     c1++;
     $display("Task1 triggered at time:%0d",$time);
     #20;
     end
     ->done;
     
endtask

task task2();

     forever
     begin
     c2++;
     $display("Task2 triggered at time:%0d",$time);
     #40;
     end
     ->done;
    
endtask

task task3();
  #200;
  ->done;
endtask


initial
    begin
    fork 
        task1();
        task2();
        task3();  
    join_any
    wait(done.triggered);
    begin
    $display("Number of times Task1 triggered =%0d and Number of times Task2 triggered =%0d",c1,c2); 
    $finish();
    end
    end
endmodule
