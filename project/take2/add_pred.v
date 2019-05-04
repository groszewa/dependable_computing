`timescale 1 ns / 100 ps

/* 8 bit Ripple carry Adder*/

/* macro for width */
`define WIDTH 2

module rc_pred( a,b, cin, parin,parout,s, cout,error_out );/* 8 bit ripple carry adder made up of 8 one_bit_adder */

input [`WIDTH:0] a; 
input [`WIDTH:0] b;
input 		 cin;
   input     parin;
   

output[`WIDTH:0] s;
output		 cout;
   output    parout;
   output    error_out;
   

wire t1,t2;
   wire p1,p2;
   wire parout_wire,cout_wire;
   wire parcheck;

   wire parout_wire2;
   
   
   

one_bit_adder a1(.a0(a[0]),.b0(b[0]),.c0(cin),.s0(s[0]),.c1(t1)  ,.parin(a[0]^b[0]^cin),.parout(p1));
one_bit_adder a2(.a0(a[1]),.b0(b[1]),.c0(t1) ,.s0(s[1]),.c1(t2)  ,.parin(p1),.parout(p2));
one_bit_adder a3(.a0(a[2]),.b0(b[2]),.c0(t2) ,.s0(s[2]),.c1(cout_wire),.parin(p2),.parout(parout_wire));
//one_bit_adder a4(a[3],b[3],t3,s[3],cout);
//one_bit_adder a5(a[4],b[4],t4,s[4],t5);
//one_bit_adder a6(a[5],b[5],t5,s[5],t6);
//one_bit_adder a7(a[6],b[6],t6,s[6],t7);
//one_bit_adder a8(a[7],b[7],t7,s[7],cout);

   assign parcheck = ((s[0] ^ s[1]) ^ (s[2]));
   

   assign cout = cout_wire;
   assign parout_wire2 = ~parin^cin^t1^t2;
   assign error_out = parcheck ^ parout_wire2;
   assign parout = parout_wire2;
   
   


endmodule

module one_bit_adder(a0,b0,c0,parin,parout,s0,c1);

/* three inputs which are 1 bit each */
input a0;
input b0;
input c0;/* carry in */
   input parin;
   

/* two outputs which are 1 bit each */
output s0;/* sum */
output c1;/* carry out */
   output parout;

   wire   c1_wire;
   
   

assign s0 = a0^b0^c0;
assign c1_wire = (a0&b0)|(b0&c0)|(c0&a0);

   assign parout = (c1_wire) ? (~parin) : (parin);
   


   assign c1 = c1_wire;
   

endmodule
