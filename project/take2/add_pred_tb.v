`timescale 1 ns / 100 ps

`define WIDTH 2

module project_tb ();
//--------------------------------------------------------- // inputs to the DUT are reg type
   reg clk_50;
   reg [2:0] a;
   reg [2:0] b;
   reg       cin;
   
   reg par;
   //reg [2:0] c;
   
   
//-------------------------------------------------------- // outputs from the DUT are wire type
   wire [2:0] x;
   wire xc;
   wire xc_pred;
   
   wire xe;
   //wire [2:0] y;
   //wire yc;
   //wire [1:0] ye;
   
//--------------------------------------------------------- // instantiate the Device Under Test (DUT)
// using named instantiation
   rc_pred U1 (.a(a),.b(b),.cin(cin),.parin(par),.parout(xc_pred),.s(x),.cout(xc),.error_out(xe));
   

   
//---------------------------------------------------------- // create a 50Mhz clock
always
    #10 clk_50 = ~clk_50;   // every ten nanoseconds invert
//----------------------------------------------------------- // initial blocks are sequential and start at time 0
  initial
    begin

       $dumpfile ("project_tb.dump");
       $dumpvars(0,project_tb);
       
    $display($time, " << Starting the Simulation >>");
       clk_50 = 1'b0;

       {a,b,cin,par} = 8'b0;
       
       
       
                                  
    //#1000;
    wait ({a,b,cin} == 7'b1111111)
    #10
    //$display($time, " << Simulation Complete >>");
    //$stop; // stop the simulation
    $finish; //stop similation and give control back to OS
  end // initial begin


//-------------------------------------------------------------- // This initial block runs concurrently with the other
// blocks in the design and starts at time 0
   integer i;
   //reg    parity_check;
   //reg    c_one_hot;
   //reg    input_good;
   
   
   
   
 initial begin
    //$monitor($time, " A=%b%b%b, B=%b%b%b, par=%b C=%b%b%b, X=%b%b%b, XC=%b, XE=%b%b, Y=%b%b%b, YC=%b YE=%b%b",a[2],a[1],a[0],b[2],b[1],b[0],par,c[2],c[1],c[0],x[2],x[1],x[0],xc,xe[1],xe[0],y[2],y[1],y[0],yc,ye[1],ye[0]);
    $monitor($time, " A=%b%b%b, B=%b%b%b, cin=%b, par=%b , X=%b%b%b, XC=%b, XP=%b,SP=%b,error=%b",a[2],a[1],a[0],b[2],b[1],b[0],cin,par,x[2],x[1],x[0],xc,xc_pred,x[0]^x[1]^x[2],xe);
    //$monitor($time, "outputs: x0=%b, x1=%h, x2=%b, xc=%b, xe0=%b, xe1=%b, y0=%b, y1=%b, y2=%b, yc=%b, ye0=%b, ye1=%b",x0,x1,x2,xc,xe0,xe1,y0,y1,y2,yc,ye0,ye1);
    for(i=0;i<128;i=i+1) begin
       #10 a     =  i[6:4];
           b     =  i[3:1];
           cin   =  i[0];
       par   =  a[0]^a[1]^a[2]^b[0]^b[1]^b[2]^1;
       
       
       //parity_check = a[2]^a[1]^a[0]^b[2]^b[1]^b[0]^par;
       //c_one_hot = (c==4||c==2||c==1);
       //input_good = parity_check & c_one_hot;
       
       
       

       //if(c==1||c==2||c==4) $display("OK, C is one hot");
       //else $display("C is not one hot, error should flag!");
       
       
       
       
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