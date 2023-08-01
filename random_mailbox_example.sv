//Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver. Also, verify the data by printing the value of data members of Generator and Driver in each transaction. Execute the code for 10 random transactions.
class transaction;
rand bit [7:0] a;
rand bit [7:0] b;
rand bit wr;
endclass



class generator;
    transaction t;
    mailbox #(transaction) mbx;
  
    function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
    endfunction

   

    task main();

    for(int i=0;i<10;i++)

    begin

    t=new();

    assert(t.randomize())

    else

    $display("Randomization failed at time:%0d",$time);

    $display("Generator Data Sent- a:%0d,b:%0d,wr:%0d",t.a,t.b,t.wr);

    mbx.put(t);

    #10;

    end

    endtask

   

endclass



class driver;
    transaction r;
    mailbox #(transaction) mbx;

    function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
    endfunction

   

    task main();
    forever
    begin
    mbx.get(r);
    $display("Driver Data Received- a:%0d,b:%0d,wr:%0d",r.a,r.b,r.wr);
    #10;
    end
    endtask

endclass





module assignments();

generator g;   
driver d;
mailbox #(transaction) mbx;

   

initial

begin

    mbx = new();
    g = new(mbx);
    d = new(mbx);

fork

g.main();

d.main();

join

end

endmodule
