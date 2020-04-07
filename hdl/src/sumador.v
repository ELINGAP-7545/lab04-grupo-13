`timescale 1ns / 1ps
 

module sumador(PinA, PinB, PCin,PCout,Pout);


    input PinA;
    input PinB;
    input PCin;
	 
    output PCout;
    output Pout;
	 
	wire a_ab;
  wire x_ab;
  wire cout_t;

  and(a_ab,PinA,PinB);
  xor(x_ab,PinA,PinB);

  xor(Pout,x_ab,PCin);
  and(cout_t,x_ab,PCin);

  or (PCout,cout_t,a_ab);
	 
   
endmodule



module sum4bcc (xi, yi,co,zi);

  input [13 :0] xi;
  input [13 :0] yi;
  output co;
  output [13 :0] zi;

  wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13;
  
  // sumador bit a bit, para sumar 14 bits y realizar la conversion del bcd a 7 segmentos
  
  sumador s0 (.PinA(xi[0]), .PinB(yi[0]), .PCin(0),  .PCout(c1) ,.Pout(zi[0]));
  sumador s1 (.PinA(xi[1]), .PinB(yi[1]), .PCin(c1), .PCout(c2) ,.Pout(zi[1]));
  sumador s2 (.PinA(xi[2]), .PinB(yi[2]), .PCin(c2), .PCout(c3) ,.Pout(zi[2]));
  sumador s3 (.PinA(xi[3]), .PinB(yi[3]), .PCin(c3), .PCout(c4) ,.Pout(zi[3]));
  sumador s4 (.PinA(xi[4]), .PinB(yi[4]), .PCin(c4),  .PCout(c5) ,.Pout(zi[4]));
  sumador s5 (.PinA(xi[5]), .PinB(yi[5]), .PCin(c5), .PCout(c6) ,.Pout(zi[5]));
  sumador s6 (.PinA(xi[6]), .PinB(yi[6]), .PCin(c6), .PCout(c7) ,.Pout(zi[6]));
  sumador s7 (.PinA(xi[7]), .PinB(yi[7]), .PCin(c7), .PCout(c8) ,.Pout(zi[7]));
  sumador s8 (.PinA(xi[8]), .PinB(yi[8]), .PCin(c8),  .PCout(c9) ,.Pout(zi[8]));
  sumador s9 (.PinA(xi[9]), .PinB(yi[9]), .PCin(c9), .PCout(c10) ,.Pout(zi[9]));
  sumador s10 (.PinA(xi[10]), .PinB(yi[10]), .PCin(c10), .PCout(c11) ,.Pout(zi[10]));
  sumador s11 (.PinA(xi[11]), .PinB(yi[11]), .PCin(c11), .PCout(c12) ,.Pout(zi[11]));
  sumador s12 (.PinA(xi[12]), .PinB(yi[12]), .PCin(12),  .PCout(c13) ,.Pout(zi[12]));
  sumador s13 (.PinA(xi[13]), .PinB(yi[13]), .PCin(c13), .PCout(c0) ,.Pout(zi[13]));
  
endmodule



