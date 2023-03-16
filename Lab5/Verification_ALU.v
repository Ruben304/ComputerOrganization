`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2023 03:41:57 PM
// Design Name: 
// Module Name: Verification_ALU
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


module Verification_ALU#(parameter N = 32)(R2, R3, select, R1, clk, c_out);
    input clk;
	input signed [N-1:0] R2;
	input signed [N-1:0] R3;
	input [2:0] select;
	output reg c_out;
	output reg [N-1:0] R1;
	
	always @(*) begin
		case(select)
			3'b000: begin
			 R1 = R2; 
			 c_out = 0;
			 end
			3'b001: begin 
			 R1 = ~R2;
			 c_out = 0;
			 end
			3'b010: begin
			 {c_out, R1} = (R2 + R3) + 1'd1;
			 end
			3'b011: begin
			 R1 = ~(R2 | R3);
			 c_out = 0;
			 end
			3'b100: begin
			 {c_out, R1} = (R2 - R3) - 1'd1;
			 end
			3'b101: begin
			 R1 = ~(R2 & R3);
			 c_out = 0;
			 end
			3'b110: begin
			 R1 = R2 & R3;
			 c_out = 0;
			 end
			3'b111: begin 
			 R1 = (R2 < R3) ? 1 : 0;
			 c_out = 0;
			 end
		endcase
	end

endmodule	
