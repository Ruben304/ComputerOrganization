`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:40 10/16/2015 
// Design Name: 
// Module Name:    S1_Register 
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

module S1_Register_tb();

	reg [31:0] InstrIn;
	reg rst, clk;
	
	wire [15:0] S1_IMM;
	wire [4:0] S1_ReadSelect1, S1_ReadSelect2, S1_WriteSelect;
	wire [2:0] S1_ALUOp;
	wire S1_WriteEnable, S1_DataSrc;
	
	S1_Register S1_Reg_Test(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.S1_ReadSelect1(S1_ReadSelect1),
		.S1_ReadSelect2(S1_ReadSelect2),
		.S1_WriteSelect(S1_WriteSelect),
		.S1_WriteEnable(S1_WriteEnable),
		.S1_IMM(S1_IMM),
		.S1_DataSrc(S1_DataSrc),
		.S1_ALUOp(S1_ALUOp)
   );
	
	always #10 
		assign clk = ~clk;
	
	initial begin
	
		InstrIn = 0;
		rst = 1;
		clk = 0;
		
		#10
		
		rst = 0;
		
		#10
		
		InstrIn = 32'b011101_00001_00001_0000000000001010; // I type, ADD r1 with 0000000A => r1 = 0000000A
		
		#10
		
		InstrIn = 32'b010101_00011_00001_00010_00000000000; // R type, ADD r1(0000000A) with r2(00000002) => r3 = 0000000C

	end
	
endmodule
