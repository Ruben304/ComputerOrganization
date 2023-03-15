`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 06:33:38 PM
// Design Name: 
// Module Name: mux
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

module mux #(parameter N = 32)(in1_val, in2_val, ALU_in, out_val);

	input signed [N-1:0] in1_val;
	input signed [N-1:0] in2_val;
	input [2:0] ALU_in;
	output reg [N-1:0] out_val;
	
	always @(*) begin
		case(ALU_in)
			3'b000: out_val = in1_val 
			3'b001: out_val = ~in1_val;
			3'b010: out_val = in1_val + in2_val;
			3'b011: out_val = ~(in1_val | in2_val);
			3'b100: out_val = in1_val - in2_val;
			3'b101: out_val = ~(in1_val & in2_val);
			3'b110: out_val = in1_val & in2_val;
			3'b111: out_val = in1_val < in2_val;
		endcase
	end
	
endmodule