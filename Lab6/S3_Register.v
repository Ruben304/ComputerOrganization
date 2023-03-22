`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2023 06:40:38 PM
// Design Name: 
// Module Name: S3_Register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S3_Register(
    input rst, 
    input clk,
    input [31:0]R1,
    input [4:0]S2_WriteSelect,
    input S2_WriteEnable, 
    output reg [31:0] ALUOut,
    output reg [4:0] S3_WriteSelect,
	output reg S3_WriteEnable
    );
    
    always@(posedge clk)
		begin
		if (rst) begin
			ALUOut <= 32'b0;
			S3_WriteSelect <= 5'd0;
			S3_WriteEnable <= 1'b0;
			end
		else begin
			ALUOut <= R1; 
			S3_WriteSelect <= S2_WriteSelect;
			S3_WriteEnable <= S2_WriteEnable;
			end
		end

endmodule
