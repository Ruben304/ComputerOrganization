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


module Verification_ALU#(parameter N = 32)(in1_val, in2_val, select, out_val, clk, c_out);
    input clk;
	input signed [N-1:0] in1_val;
	input signed [N-1:0] in2_val;
	input [2:0] select;
	output reg c_out;
	output reg [N-1:0] out_val;
	
	always @(*) begin
		case(select)
			3'b000: begin
			 out_val = in1_val; 
			 c_out = 0;
			 end
			3'b001: begin 
			 out_val = ~in1_val;
			 c_out = 0;
			 end
			3'b010: begin
			 {c_out, out_val} = in1_val + in2_val;
			 end
			3'b011: begin
			 out_val = ~(in1_val | in2_val);
			 end
			3'b100: begin
			 {c_out, out_val} = in1_val - in2_val;
			 end
			3'b101: begin
			 out_val = ~(in1_val & in2_val);
			 c_out = 0;
			 end
			3'b110: begin
			 out_val = in1_val & in2_val;
			 c_out = 0;
			 end
			3'b111: begin 
			 out_val = (in1_val < in2_val) ? 1 : 0;
			 c_out = 0;
			 end
		endcase
	end

endmodule	
