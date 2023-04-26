`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:32 03/21/2017 
// Design Name: 
// Module Name:    discussion_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module discussion_tb;

	// Inputs
	reg clk;
	reg Reset;
	reg LoadInstructions;
	reg [31:0] Instruction;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.out(out), 
		.clk(clk), 
		.Reset(Reset), 
		.LoadInstructions(LoadInstructions), 
		.Instruction(Instruction)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 1;
		LoadInstructions = 0;
		Instruction = 0;
		#10;
		Reset = 0;
		LoadInstructions = 1;
		#10;
		// begin by loading values into registers
		Instruction = 32'b001000_00000_00001_0000000101101101; //addi $R1, 365
		#10;
		Instruction = 32'b001000_00000_00010_0000000001011100; //addi $R2, 92
		#10;
		Instruction = 32'b001000_00000_00011_0000000000010101; //addi $R3, 21
		#10;
		Instruction = 32'b001000_00000_00100_0000000010010010; //addi $R4, 146    
		#10;
		Instruction = 32'b001000_00000_00111_0000000000001001; //addi $R7, 9
		#10;
		Instruction = 32'b001000_00000_01000_0000000000001010; //addi $R8, 10
		#10;
		Instruction = 32'b001000_00000_00101_0000000000000101; //addi $R5, 5
		#10;
		Instruction = 32'b000000_00001_00010_00101_00000_100000;  //add  $R5, $R1, $R2 (R5 = 457 from 5): 1 ahead Hazard    
		#10;
		Instruction = 32'b000000_00011_00101_00110_00000_101010;  //slt  $R6, $R3, $R5  21 < 457 = 1
		#10;
		Instruction = 32'b100011_00000_00100_00000_00000_000100;   // LW $R4, 4(R0)                                                               
		#10;
		Instruction = 32'b000000_00100_00110_00111_00000_100010;   // sub  $R7, $R4, $R6 (R4/4 - R6/1 = 3/R7)  
		#10;
		Instruction = 32'b101011_00000_00111_00000_00000_000010;	// SW R7, 2(R0) (3 to 2) changes write value right away and saves it to there: 1 ahead Hazard  
		#10;
		Instruction = 32'b000000_00111_00010_01000_00000_100000;	// add R8, R7, R2 (92 + 3 = 95) 2 ahead hazard of using new value of R7 of 3 instead 9
		#10;
		Instruction = 32'b000011_00110_00100_11111_11111_11_1111;   // BNE R6, R8, 5 (R6/1 and R8/95 are different so bring to begining)
		#10;
		Instruction = 32'b001000_00000_01101_0000000000010101; //addi $R13, 21
		#10;

		LoadInstructions = 0;
      	Reset = 1;
		#10;
		Reset = 0;
		#100;
//		Instruction = 32'b001000_00000_00001_0000000000010000; //addi $R1, $R0, 16
//		#10;
//		Instruction = 32'b001000_00000_00010_0000000000011000; //addi $R2, $R0, 24
//		#10;
//		Instruction = 32'b000000_00010_00010_00010_00000_100000; //add  $R2, $R2, $R2
//		#10;
//		Instruction = 32'b001000_00000_00011_0000000110110100; //addi $R3, $R0, 436
//		#10;
//		Instruction = 32'b001000_00000_00100_0000000000001010; //addi $R4, $R0, 10
//		#10;
//		Instruction = 32'b001000_00000_00101_0000000000000001; //addi $R5, $R0, 1
//		#10;
//		Instruction = 32'b100011_00000_00110_0000000000001000;	// LW $R6, 8(R0)
//		#10;
//		Instruction = 32'b000000_00110_00011_01001_00000_100101; //or  $R9, $R6, $R3  1 ahead hazard
//		#10;
//		Instruction = 32'b000000_00001_00010_01000_00000_100010; //sub  $R8, $R1, $R2
//		#10;
//		Instruction = 32'b000000_00101_01001_01010_00000_100000; //add  $R10, $R5, $R9
//		#10;
//		Instruction = 32'b101011_00000_00111_0000000000001100; 	// SW	$R7, 12(R0) 
//		#10;
//		Instruction = 32'b001000_01010_01011_0000000000111001; //addi $R11, $R10, 57 2 ahead hazard
//		#10;
//		Instruction = 32'b000000_00111_00010_01100_00000_100100; //and  $R12, $R7, $R2
//		#10;
//		Instruction = 32'b000000_00100_01100_01101_00000_100100; //and  $R13, $R4, $R12 1 ahead hazard
//		#10;
//		Instruction = 32'b000000_01011_01100_01101_00000_101010; //slt  $R13, $R11, $R12 
//        #10 
//        Instruction = 32'b100011_00000_01110_0000000000010000;	// LW $R14, 16(R0)
//        #10
//        Instruction = 32'b101011_00010_01110_0000000000000000; 	// SW $R14, 0(R2) RAW hazard
//		#10;
//		LoadInstructions = 0;
//      		Reset = 1;
//		#10;
//		Reset = 0;
//		#100;
		// Add stimulus here

	end
	always begin
	#5;
	clk = ~clk;
	end
      
endmodule
