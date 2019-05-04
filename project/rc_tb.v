`timescale 1 ns / 100 ps

`define WIDTH 3

module rc_tb ();
//--------------------------------------------------------- // inputs to the DUT are reg type
   reg clk_50;
   reg [`WIDTH:0] a;
   reg [`WIDTH:0] b;
   reg  cin;
   
//-------------------------------------------------------- // outputs from the DUT are wire type
   wire    cout;
   wire    [`WIDTH:0]  s;
//--------------------------------------------------------- // instantiate the Device Under Test (DUT)
// using named instantiation
rc U1 ( .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
);
//---------------------------------------------------------- // create a 50Mhz clock
always
    #10 clk_50 = ~clk_50;   // every ten nanoseconds invert
//----------------------------------------------------------- // initial blocks are sequential and start at time 0
  initial
    begin

       $dumpfile ("rc_tb.dump");
       $dumpvars(0,rc_tb);
       
    $display($time, " << Starting the Simulation >>");
    clk_50 = 1'b0;
    a   = 3'b0;
    b   = 3'b0;
    cin = 1'b0;
                                  
    //#1000;
    wait (a == 15 && b == 15 && cin == 1)
    #10
    //$display($time, " << Simulation Complete >>");
    //$stop; // stop the simulation
    $finish; //stop similation and give control back to OS
  end // initial begin


//-------------------------------------------------------------- // This initial block runs concurrently with the other
// blocks in the design and starts at time 0
   integer i;
   
 initial begin
    $monitor($time, "a=%h, b=%h, cin=%b, s=%h, cout=%b", a, b, cin, s, cout);
    for(i=0;i<1024;i=i+1) begin
       #10 a = i[3:0];
       b = i[7:4];
       cin = i[8];
    end
    
    
 
   
    
    
    
// always @ (posedge clk_50)
    //   a = a+1;
    // end
     
  end
//-------------------------------------------------------------- // The load_count task loads the counter with the value passed
//  task load_count;
//     input [3:0] load_value;
//     begin
//@(negedge clk_50);
//$display($time, " << Loading the counter with %h >>", load_value); load_l = 1’b0;
//count_in = load_value;
//@(negedge clk_50);
//load_l = 1’b1;
//     end
//  endtask //of load_count
endmodule //of cnt16_tb
