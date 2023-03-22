`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 10/16/2015 
// Design Name: 
// Module Name:    Pipeline 
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
module Pipeline(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output [31:0] Out
   );


	// The naming format for wire: Source_Destination_portname
	wire [4:0] S1_Reg_ReadSelect1;
	wire [4:0] S1_Reg_ReadSelect2;
	wire [4:0] S1_S2_WriteSelect;
	wire S1_S2_WriteEnable;
	wire [15:0] S1_S2_IMM;
	wire S1_S2_DataSrc;
	wire [2:0] S1_S2_ALUOp;
	wire [31:0] Reg_S2_ReadData1;
	wire [31:0] Reg_S2_ReadData2;
	wire [4:0] S2_Reg_WriteSelect;
	wire S2_Reg_WriteEnable;
	wire [15:0] S2_IMM_mux;
	wire S2_DataSrc_mux;
	wire S2_ALUOp_select;
	wire [4:0] S2_S3_WriteSelect;
	wire S2_S3_WriteEnable;
	wire [4:0] S3_Reg_WriteSelect;
	wire S3_Reg_WriteEnable;	
	wire [31:0] R2, R3, R1;
    wire c_out;
    
	S1_Register S1_Reg(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.S1_ReadSelect1(S1_Reg_ReadSelect1),
		.S1_ReadSelect2(S1_Reg_ReadSelect2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.S1_IMM(S1_S2_IMM),
		.S1_DataSrc(S1_S2_DataSrc),
		.S1_ALUOp(S1_S2_ALUOp)
   );


	nbit_register_file Register_File (
		.write_data(Out),								
		.read_data_1(Reg_S2_ReadData1),
		.read_data_2(Reg_S2_ReadData2),
		.read_sel_1(S1_Reg_ReadSelect1),
		.read_sel_2(S1_Reg_ReadSelect2),
		.write_address(S2_Reg_WriteSelect),
		.RegWrite(S2_Reg_WriteEnable),
		.clk(clk)
	);
		
	
	S2_Register S2_Reg(
		.clk(clk),
		.rst(rst),
		.Reg_ReadData1(Reg_S2_ReadData1),
		.Reg_ReadData2(Reg_S2_ReadData2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.S1_aluop(S1_S2_ALUOp),
		.S1_imm(S1_S2_IMM),
		.S1_datasrc(S1_S2_DataSrc),
		.S2_ReadData1(R2),
		.S2_ReadData2(R3),
		.S2_WriteSelect(S2_Reg_WriteSelect),
		.S2_WriteEnable(S2_Reg_WriteEnable),
		.S2_IMM(S2_IMM_mux),
		.S2_DataSrc(S2_DataSrc_mux),
		.S2_ALUOp(S2_ALUOp_select)
   );

	ALU ALU(
	   .clk(clk),
	   .R2(R2),
	   .R3(R3),
	   .c_in(1'b0),
	   .ALUOp(S2_ALUOp_select),
	   .R1(R1),
	   .c_out(c_out_output)
	);
	
	S3_Register S3_Reg(
	    .clk(clk),
	    .rst(rst),
	    .R1(R1),
	    .S2_WriteSelect(S2_S3_WriteSelect),
	    .S2_WriteEnable(S2_S3_WriteEnable),
	    .ALUOut(Out),
	    .S3_WriteSelect(S3_Reg_WriteSelect),
	    .S3_WriteEnable(S3_Reg_WriteEnable)	    
	);
	    

endmodule
