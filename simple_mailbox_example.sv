class transaction;
bit [7:0] addr = 7'h12;
bit [3:0] data = 4'h4;
bit we = 1'b1;
bit rst = 1'b0;
endclass





class generator;

    transaction t;
    mailbox #(transaction) mbx;

    function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
    endfunction

    task main();
    t=new();
    mbx.put(t);
    $display("Generator Data Sent- addr:%0h,data:%0h,we:%0d,rst:%0d",t.addr,t.data,t.we,t.rst);
    endtask

endclass



class driver;

    transaction r;
    mailbox #(transaction) mbx;

    function new(mailbox #(transaction) mbx);
    this.mbx=mbx;
    endfunction

    task main();
    r = new();
    mbx.get(r);
    $display("Driver Data Received- addr:%0h,data:%0h,we:%0d,rst:%0d",r.addr,r.data,r.we,r.rst);
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
    g.main();   
    d.main();

end


endmodule
