module BCDtoSSeg (BCD, SSeg, an); // inicio del modulo

  input [3:0] BCD; //Entrada 
  output reg [0:6] SSeg; //salida
  output [3:0] an; // salida

assign an=4'b1110; // esto quiere decir que estamos inicializando por anodo y un display.
// assign una asignacion 

//En sistemas de computación,Binary-Coded Decimal (BCD) o Decimal codificado en binario 
//es un estándar para representar números decimales en el sistema binario, en donde cada//
// dígito decimal es codificado con una secuencia de 4 bits.

always @ ( * ) begin // Este tipo de procesos se ejecuta continuamente a modo de bucle,
// y como su propio nombre indica, está continuamente ejecutándose

  case (BCD) // case evalúa una expresión y en función de su valor ejecutará la sentencia o 
  //grupo de sentencias agrupadas en el primer caso que coincida
	 	 
   4'b0000: SSeg = 7'b0000001; // "0"  En este proceso se realiza el cambio de Binario a BCD
	4'b0001: SSeg = 7'b1001111; // "1"  En este proceso se realiza el cambio de Binario a BCD
	4'b0010: SSeg = 7'b0010010; // "2"  En este proceso se realiza el cambio de Binario a BCD
	4'b0011: SSeg = 7'b0000110; // "3"  En este proceso se realiza el cambio de Binario a BCD
	4'b0100: SSeg = 7'b1001100; // "4"  En este proceso se realiza el cambio de Binario a BCD
	4'b0101: SSeg = 7'b0100100; // "5"  En este proceso se realiza el cambio de Binario a BCD
	4'b0110: SSeg = 7'b0100000; // "6"  En este proceso se realiza el cambio de Binario a BCD
	4'b0111: SSeg = 7'b0001111; // "7"  En este proceso se realiza el cambio de Binario a BCD
	4'b1000: SSeg = 7'b0000000; // "8"  En este proceso se realiza el cambio de Binario a BCD
	4'b1001: SSeg = 7'b0000100; // "9"  En este proceso se realiza el cambio de Binario a BCD
   4'ha: SSeg = 7'b0001000;  
   4'hb: SSeg = 7'b1100000;
   4'hc: SSeg = 7'b0110001;
   4'hd: SSeg = 7'b1000010;
   4'he: SSeg = 7'b0110000;
   4'hf: SSeg = 7'b0111000;
    default:  // por defecto 
    SSeg = 0;
  endcase // fin del case
end // fin del always
endmodule  // fin del modulo
