`timescale 1ns / 1ps // timescale time_units / precision_units Donde "time_units" es un valor que declara la unidad de tiempo de los retardos en el módulo en el que se especifica este valor.
Mientras que "precision_units" es un valor que declara la precisión de la unidad de tiempo ha ser usada por el simulador

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:21 09/05/2019
// Design Name:   display
// Module Name:   C:/Users/UECCI/Desktop/ejer01/display_7segx4/testbench.v
// Project Name:  display_7segx4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs entradas reg también llamada variable. Son utilizados para almacenar valores, tienen memoria.
	reg [15:0] num;
	reg clk2;
	reg rst;

	// Outputs Salidas
	wire [0:6] sseg;  //  corresponden a cables físicos que interconectan componentes, por tanto, no tienen memoria.
	wire [3:0] an;    //  corresponden a cables físicos que interconectan componentes, por tanto, no tienen memoria.

	// Instantiate the Unit Under Test (UUT) aca realiza una tarea especifica en el display 
	display uut (
	//	.num(num), 
		.clk(clk2), 
		.sseg(sseg), 
		.an(an), 
		.rst(rst)
	);

	initial begin  //aca realiza una tarea especifica esta inicializando las entradas 
		// Initialize Inputs
		clk2= 0;
		rst = 1;
		#10 rst =0;
		
		num = 16'h4321; // esto quiere decir que los 4 display inicializan con los numeros 4321.
        

	end  
      

	always #1 clk2 = ~clk2; // esto es la frecuencia 
	
endmodule // fin del modulo

