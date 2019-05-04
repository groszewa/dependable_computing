/* 8 bit carry lookahead adder*/

/* macro for width */
`define WIDTH 7

module main( a, b, cin, s, cout );/* 8 bit carry lookahead adder made up of 4 two_bit_cla */

input [`WIDTH:0] a; 
input [`WIDTH:0] b;
input 		 cin;

output[`WIDTH:0] s;
output		 cout;

wire t1,t2,t3;

two_bit_cla cla1(a[1],a[0],b[1],b[0],cin,s[1],s[0],t1);
two_bit_cla cla2(a[3],a[2],b[3],b[2],t1,s[3],s[2],t2);
two_bit_cla cla3(a[5],a[4],b[5],b[4],t2,s[5],s[4],t3);
two_bit_cla cla4(a[7],a[6],b[7],b[6],t3,s[7],s[6],cout);

endmodule

module two_bit_cla(a1,a0,b1,b0,cin,s1,s0,cout);

/* five inputs which are 1 bit each */
input a0;
input b0;
input a1;
input b1;
input cin;/* carry in */

/* three outputs which are 1 bit each */
output s0;
output s1;/* sum */
output cout;/* carry out */

wire temp;/* carry out from 1st to 2nd stage */

assign s0 = a0^b0^cin;
assign temp = (a0&b0)|(b0&cin)|(cin&a0);
assign s1 = a1^b1^temp;

assign cout = (a1&b1) | ( (a1^b1) & ((a0&b0) | ((a0^b0)&cin) ) ) ;

endmodule
