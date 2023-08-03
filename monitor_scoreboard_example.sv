//Create Monitor and Scoreboard Code for Synchronous 4-bit Multiplier.
// //DUT
// module top
// (
//   input clk,
//   input [3:0] a,b,
//   output reg [7:0] mul
// );
  
//   always@(posedge clk)
//     begin
//      mul <= a * b;
//     end
  
// endmodule


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


interface top_if;
  logic clk;
  logic [3:0] a, b;
  logic [7:0] mul;
endinterface


class monitor;
    
    transaction t;
    virtual top_if tif;
    mailbox #(transaction) mbx;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task main();
    t = new();
    forever
    begin
        repeat(2)@(posedge tif.clk);
        t.a = tif.a;
        t.b = tif.b;
        t.mul = tif.mul;
        $display("Sent from Monitor");
        t.display();
        mbx.put(t);
    end
    endtask
    
endclass


class scoreboard;

    transaction st;
    mailbox #(transaction) mbx;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task compare(input transaction st);
        if(st.mul == (st.a*st.b))
        begin
        $display("Results match");
        $display("***********************");
        end
        else
        begin
        $display("Results do not match");
        $display("***********************");
        end
    endtask
    
    
    task main();
    forever
    begin 
        mbx.get(st);
        $display("Data Received in Scoreboard");
        st.display();
        compare(st);
        #20;
    end
    endtask    
endclass


module assignments();
top_if vif();
monitor m;
scoreboard s;
mailbox #(transaction) mbx;
  
  top dut (.clk(vif.clk), .a(vif.a), .b(vif.b), .mul(vif.mul));
  
  initial begin
    vif.clk <= 0;
  end
  
  always #5 vif.clk <= ~vif.clk;
  
  initial 
  begin
    for(int i = 0; i<20; i++) begin
      repeat(2)@(posedge vif.clk);
      vif.a <= $urandom_range(1,15);
      vif.b <= $urandom_range(1,15);
    end
    
  end
  
  initial 
  begin
    mbx = new();
    m = new(mbx);
    s = new(mbx);
    m.tif = vif;
  end
  
  
  initial 
  begin
    fork
    m.main();
    s.main();
    join 
  end
  
  initial 
  begin
    
    #400;
    $finish();
  end
  
endmodule
