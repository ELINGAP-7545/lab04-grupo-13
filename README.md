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

