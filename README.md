Yonalid Martinez
Diego Alejandro codigo 47412
Andres Beltran 83724

codigo de para iniciar el laboratorio

module bod_7seg_decoder(input [3:0] bcd, output reg [6:0] seven_seg);


always @(*)

case (bcd)


//abcd

4'b0000:seven_seg= 7'b1111110;
4'b0001:seven_seg= 7'b0110000;
4'b0010:seven_seg= 7'b1101101;
4'b0011:seven_seg= 7'b1111001;
4'b0100:seven_seg= 7'b0110011;
4'b0101:seven_seg= 7'b1011011;
4'b0110:seven_seg= 7'b1011111;
4'b0111:seven_seg= 7'b1110000;
4'b1000:seven_seg= 7'b1111111;
4'b1001:seven_seg= 7'b1111011;
endcase 
endmodule 

<<<<<<< HEAD
------------------------------------------------------------------------------------------
siguiente codigo 
module BCDtoSSeg (BCD, SSeg);

  input [3:0] BCD;
  output reg [6:0] SSeg;
always @ ( * ) begin
  case (BCD)
   4'b0000: SSeg = 7'b0000001; // "0"  
	4'b0001: SSeg = 7'b1001111; // "1" 
	4'b0010: SSeg = 7'b0010010; // "2" 
	4'b0011: SSeg = 7'b0000110; // "3" 
	4'b0100: SSeg = 7'b1001100; // "4" 
	4'b0101: SSeg = 7'b0100100; // "5" 
	4'b0110: SSeg = 7'b0100000; // "6" 
	4'b0111: SSeg = 7'b0001111; // "7" 
	4'b1000: SSeg = 7'b0000000; // "8"  
	4'b1001: SSeg = 7'b0000100; // "9" 
   4'ha: SSeg = 7'b0001000;  
   4'hb: SSeg = 7'b1100000;
   4'hc: SSeg = 7'b0110001;
   4'hd: SSeg = 7'b1000010;
   4'he: SSeg = 7'b0110000;
   4'hf: SSeg = 7'b0111000;
    default:
    SSeg = 0;
  endcase
end

endmodule

=======
Restricciones:
BCD: 4 bits entran, salen 7 Bits
sumador= Suma bit a bit, da la respuesta en 14 bits
Conversor:transforma los bits de suma en en codigo BCD; Entran 14 bits salida 4bits por unidad (Unidades, Decenas,Centenas,Unidades de mil)
>>>>>>> 1fe1320cb71733fe4854d91dbd4a63e8dcff12eb

______________________________________________________________________________________________

Codigo para activar los 4 display.
Diego Roldan

module display(num,clk,sseg,an,rst,led);
    input [15:0] num;
    input clk;
    output [0:6] sseg;
    output reg [3:0] an;
	 input rst;
	 output led;
    



reg [3:0]bcd=0;

 
BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg));

reg [26:0] cfreq=0;
wire enable;

// Divisor de frecuecia

assign enable = cfreq[16];
assign led =enable;
always @(posedge clk) begin
  if(rst==1) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end

reg [1:0] count =0;
always @(posedge enable) begin
		if(rst==1) begin
			count<= 0;
			an<=4'b1111; 
		end else begin 
			count<= count+1;
			an<=4'b1101; 
			case (count) 
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end 
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end 
			endcase
		end
      end

endmodule
________________________________________________________________________________________________________
Evidenica

![display1](https://user-images.githubusercontent.com/62714712/78512813-22f76280-776d-11ea-9978-19aa5bea22b2.PNG)

