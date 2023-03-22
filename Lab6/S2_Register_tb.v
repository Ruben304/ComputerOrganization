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

module S2_Register_tb();

	reg [31:0] Reg_ReadData1, Reg_ReadData2;
	reg [15:0] S1_IMM;
	reg [4:0] S1_WriteSelect;
	reg [2:0] S1_ALUOp;
	reg rst, clk, S1_DataSrc, S1_WriteEnable;
	
	wire [31:0] S2_ReadData1, S2_ReadData2;
	wire [15:0] S2_IMM;
	wire [4:0] S2_WriteSelect;
	wire [2:0] S2_ALUOp;
	wire S2_WriteEnable, S2_DataSrc;
	
	S2_Register S2_Reg_Test(
		.clk(clk),
		.rst(rst),
		.Reg_ReadData1(Reg_ReadData1),
		.Reg_ReadData2(Reg_ReadData2),
		.S1_WriteSelect(S1_WriteSelect),
		.S1_WriteEnable(S1_WriteEnable),
		.S1_IMM(S1_IMM),
		.S1_DataSrc(S1_DataSrc),
		.S1_ALUOp(S1_ALUOp),
		.S2_ReadData1(S2_ReadData1),
		.S2_ReadData2(S2_ReadData2),
		.S2_WriteSelect(S2_WriteSelect),
		.S2_WriteEnable(S2_WriteEnable),
		.S2_IMM(S2_IMM),
		.S2_DataSrc(S2_DataSrc),
		.S2_ALUOp(S2_ALUOp)
   );
	
	always #10 
		assign clk = ~clk;
	
	initial begin
	
		rst = 1;
		clk = 0;
		
		Reg_ReadData1 = 32'b0;
		Reg_ReadData2 = 32'b0;
		
		S1_IMM = 16'b0;
		S1_WriteSelect = 5'b0;
		S1_WriteEnable = 5'b0;
		S1_ALUOp = 3'b0;
		S1_DataSrc = 1'b0;
		
		#10
		
		rst = 0;
		
		#10
		
		Reg_ReadData1 = 32'b00000000110000001110000000000100;
		Reg_ReadData2 = 32'b01100000100000000100110010100100;
		
		S1_IMM = 16'b0000001111001010;
		S1_WriteSelect = 5'b00001;
		S1_WriteEnable = 5'b00010;
		S1_ALUOp = 3'b001;
		S1_DataSrc = 1'b1;
		
		#10
		
		Reg_ReadData1 = 32'b000110101101000010000110100000100;
		Reg_ReadData2 = 32'b11101100100110000100110010100100;
		
		S1_IMM = 16'b0100100111001010;
		S1_WriteSelect = 5'b01100;
		S1_WriteEnable = 5'b01001;
		S1_ALUOp = 3'b100;
		S1_DataSrc = 1'b0;
	
	end
	

endmodule
