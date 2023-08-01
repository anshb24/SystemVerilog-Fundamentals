//Assume class consists of three data members a, b, and c each of size 4-bit. Create a task inside the class that returns the result of the addition of data members. The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.

class cont;

    bit [3:0] a,b,c;

    function new(input bit [3:0] a=0,b=0,c=0);
    this.a=a;
    this.b=b;
    this.c=c;
    endfunction

   

    task add();
    bit[3:0] res = a+b+c;
    $display("Result of %0d+%0d+%0d=%0d",a,b,c,res);
    endtask

endclass





module test();
cont c1;
initial

begin
c1=new(1,2,4);
c1.add();
end

endmodule
