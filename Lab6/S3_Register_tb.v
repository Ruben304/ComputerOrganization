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

module S3_Register_tb();

	reg [31:0] R1;
	reg [4:0] S2_WriteSelect;
	reg rst, clk, S2_WriteEnable;
	
	wire [31:0] ALUOut;
	wire [4:0] S3_WriteSelect;
	wire S3_WriteEnable;
	
	S3_Register S3_Reg_Test(
		.clk(clk),
		.rst(rst),
		.R1(R1),
		.S2_WriteSelect(S2_WriteSelect),
		.S2_WriteEnable(S2_WriteEnable),
		.S3_WriteSelect(S3_WriteSelect),
		.S3_WriteEnable(S3_WriteEnable),
		.ALUOut(ALUOut)
   );
	
	always #10 
		assign clk = ~clk;
	
	initial begin
	
		rst = 1;
		clk = 0;
		
		R1 = 32'b0;
        
		S2_WriteSelect = 4'b0;
        	S2_WriteEnable = 1'b0;
		
		#10
		
		rst = 0;
		
		#10
		
		R1 = 32'b00000000110000001110000000000100;
        
		S2_WriteSelect = 4'b0011;
        	S2_WriteEnable = 1'b1;
		
		#10
		
		R1 = 32'b000110101101000010000110100000100;
        
		S2_WriteSelect = 4'b1100;
        	S2_WriteEnable = 1'b0;
		
		#10
	
	end
	

endmodule
