`timescale 1ns / 1ps


module 7segg_tb (BCD,SSeg);

	// Inputs
	reg [3:0] BCD;

	// Outputs
	wire [6:0] SSeg;

	// Instantiate the Unit Under Test (UUT)
	7segg uut (.BCD(BCD), .SSeg(SSeg));

	initial begin

		BCD = 0; #10;
		BCD = 1; #10;
		BCD = 2; #10;
		BCD = 3; #10;
		BCD = 4; #10;
		BCD = 5; #10;
		BCD = 6; #10;
		BCD = 7; #10;
		BCD = 8; #10;
		BCD = 9; #10;

	end

   initial begin: TEST_CASE
     $dumpfile("7segg_tb.vcd");
	   //$dumpvars(-1, uut);
     #(200) $finish;
   end
	
endmodule
	
