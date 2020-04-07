//Declaracion del modulo de sus entradas y salidas.
module display(num,clk,sseg,an,rst,led); //inicio del modulo 
    input [15:0] num; 
    input clk;
    output [0:6] sseg;
    output reg [3:0] an;
	 input rst;
	 output led;
    
reg [3:0]bcd=0;// Declaración de señales y variables que se utilizarán.

 
BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg)); //Aca estamos llamando al otro pyoyecto y hacer una multiplexacion 
// para que funcionen 

reg [26:0] cfreq=0; // Declaración de señales y variables que se utilizarán.
wire enable;

/* Divisor de frecuecia: el Docente solicita que cada display debe activarse máximo cada 16 ms.
   por eso se realiza el divisor de frecuencia cada 16ms,La sentencia condicional if-else 
	controla la ejecución de otras sentencias y/o asignaciones. En caso de haber múltiples sentencias o asignaciones 
	es necesario hacer uso del bloque begin-end. La sintaxis de esta estructura es la siguiente. Su función es dividir 
	la frecuencia de clk de entrada, en el tiempo requerido para cada camvio de ánodo*/

assign enable = cfreq[16]; 
assign led =enable;
always @(posedge clk) begin
  if(rst==1) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end

reg [1:0] count =0;// Declaración de señales y variables que se utilizarán.

/*Aca vamos a tener una sentencia condicional if y else donde si rst entrada es ==1 entonces count es menor 
o igual a 0  entonces todos los display quedan encendidos si no entonces entra en ELSE donde nos va a encerder 
el primer display y va a seguir asi mientras el IF no entre, osea que cada else encedera el primero sumara 1
y encendera el siguiente display  para eso entra el case por que ella tiene el resultado del if-else = count 
y se ejecutara para los 4 display  */
always @(posedge enable) begin
		if(rst==1) begin
			count<= 0;
			an<=4'b1111; 
		end else begin 
			count<= count+1;
			an<=4'b1101; 
			case (count) 
			
			//Evalúa una expresión y en función de su valor ejecutará la sentencia o 
         //grupo de sentencias agrupadas en el primer caso que coincida
			
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end 
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end 
			endcase // fin del case
		end
      end //fin del else.

endmodule
// fin del modulo.