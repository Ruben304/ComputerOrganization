`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.Out(Out)
	);

	// Define clk
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		InstrIn = 0;

		// Wait 10 ns for global reset to finish
		#10;
		rst = 0;
		
//		#10
//		InstrIn = 32'b000000_00010_00001_00010_00000000000;				// Read out R1 and R2, write result to R2
		
//		#10;
//		InstrIn = 32'b000000_00100_00011_00100_00000000000;				// Read out R3 and R4, write result to R4
		
//		#10;
//		InstrIn = 32'b000000_00110_00101_00110_00000000000;				// Read out R5 and R6, write result to R6
        
//		#10;
//		InstrIn = 32'b000000_00000_00000_00000_00000000000;				// Do nothing
		
		#10; 
//		InstrIn = 32'b011101_00001_000001_0000000000001010; // I type,  r1 with 0000000A => r1 = 0000000A 
//		#10;
//		InstrIn = 32'b011011_00010_00010_0000000000000010; // I type,  r2 with 00000002 => r2 = 00000002 
		InstrIn= 32'b010000_10000_01010_00000_00000000000; // R type,  MOV R10(100) to R16(160 -> 100)
		#10;
		InstrIn= 32'b010001_11100_00111_00000_00000000000; // R type,  NOT R7(70) to R28(290 -> 4294967225) look at 65ns
		#10;
		InstrIn= 32'b010100_00100_00000_00001_00000000000; // R type,  NOR R0(0) and R1(10) to store in R4 
		#10;
		InstrIn= 32'b010110_11101_11110_00010_00000000000; // R type,  SUB R31(310) and R2(20) to store in R29(290 -> )
		#10;
		InstrIn= 32'b010101_11011_01101_00110_00000000000; // R type, NAND R13(180) and R6(60) to store in R27(270 -> 4294967295) look at 85ns 
		#10;
		InstrIn= 32'b010011_10100_01000_00010_00000000000; // R type, ADD R8(80) and R2(20) to store in R24(240 -> )
		#10;
		InstrIn= 32'b010110_01001_00000_00100_00000000000; // R type, AND R0(0) and R6(60) to store in R9(90 -> 0) 
		#10;
		InstrIn= 32'b010111_10110_00001_01110_00000000000; // R type, SLT  R14(140) and R1(10) to store in R22(220 -> 0)
         #10
	    InstrIn = 32'b011001_00010_00010_0000000000000000;  // I type, NOT R2
	   	 #10
	    InstrIn = 32'b011000_00011_00001_0000000000000000;  // I type, MOV r1(10) to r3(30) r3 => 10   
	end
      
endmodul
