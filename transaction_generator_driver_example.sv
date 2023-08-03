// Create transaction, Generator and Driver code for Synchronus 4-bit Multiplier.
//DUT
/*
module top
(
  input clk,
  input [3:0] a,b,
  output reg [7:0] mul
);
  
  always@(posedge clk)
    begin
     mul <= a * b;
    end
  
endmodule
*/

class transaction;

   randc bit [3:0] a,b;
   bit [7:0] mul;

   function void display();
    $display("Value of a=%0d,b=%0d,mul=%0d",a,b,mul);
   endfunction

  
   function transaction copy();
    copy = new();
    copy.a=this.a;
    copy.b=this.b;
    copy.mul=this.mul;
   endfunction
endclass

class generator;
    transaction t;
    mailbox #(transaction) mbx;
    event done;

    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
        t = new();
    endfunction

   

   

    task main();

    for(int i=0;i<10;i++)
    begin
        assert(t.randomize())
        else
        $display("Randomization Failed");
        mbx.put(t.copy());
        $display("Generator Sent to Driver");
        t.display();
        #20;
    end
    ->done;
    endtask
endclass





interface ifs;
    logic [3:0] a,b;
    logic [7:0] mul;
    logic clk;
endinterface


class driver;

    transaction dt;
    mailbox #(transaction) mbx;
    virtual ifs ift;

   

    function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
    endfunction

   
    task main();
    forever
    begin
    mbx.get(dt);
    @(posedge ift.clk);
    ift.a<=dt.a;
    ift.b<=dt.b;
    $display("Sent from Driver");
    dt.display();
    end
    endtask

endclass



module assignments();

    ifs ift();
    driver d;
    generator g;
    event done;

    mailbox #(transaction) mbx;

   

    top dut(

        .a(ift.a),.b(ift.b),.mul(ift.mul),.clk(ift.clk)

    );

   

    initial
    begin
        ift.clk<=0;
    end
  
    always #10 ift.clk <=~ ift.clk;

    initial

    begin
        mbx = new();
        d = new(mbx);
        g= new(mbx);
        d.ift = ift;
        done = g.done;
    end

   

    initial
    begin

    fork
    d.main();
    g.main();
    join_none
    wait(done.triggered);
    $finish();   
    end

endmodule
