`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2023 01:46:58 PM
// Design Name: 
// Module Name: ALU
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

module ALU #(parameter N = 32)(in1_val, in2_val, mux_in, c_in, out1_val, out2_val, c_out);

	input [N-1:0] in1_val, in2_val;
	input [2:0] mux_in;
	input c_in;
	output [N-1:0] out1_val, out2_val;
	output c_out;
	
	wire [N-1:0] mov_out;
	wire [N-1:0] not_out;
	wire [N-1:0] add_out;
	wire [N-1:0] nor_out;
	wire [N-1:0] sub_out;
	wire [N-1:0] nand_out;
	wire [N-1:0] and_out;
	wire [N-1:0] slt_out;
	
	wire [N-1:0] output1;
	wire c_out_output, c_out_add, c_out_sub, c_out_slt;
	
	
		Nbit_NOT #(.N(N)) notALU (.out(not_out[N-1:0]), .in(in1_val[N-1:0]));
		
		NBit_adder #(.N(N)) adderALU (.c_out(c_out_add), .sum(add_out[N-1:0]), .a(in1_val[N-1:0]), .b(in2_val[N-1:0]), .c_in(c_in));
		
		NBit_NOR #(.N(N)) norALU (.out_val(nor_out[N-1:0]), .in1_val(in1_val[N-1:0]), .in2_val(in2_val[N-1:0]));
		
		Nbit_Sub #(.N(N)) subALU (.c_out(c_out_sub), .sum(sub_out[N-1:0]), .a(in1_val[N-1:0]), .b(in2_val[N-1:0]), .c_in(c_in));
		
		Nbit_NAND #(.N(N)) nandALU (.out_val(nand_out[N-1:0]), .in1_val(in1_val[N-1:0]), .in2_val(in2_val[N-1:0]));
		
		Nbit_AND #(.N(N)) andALU (.out_val(and_out[N-1:0]), .in1_val(in1_val[N-1:0]), .in2_val(in2_val[N-1:0]));
		
		Nbit_SLT #(.N(N)) sltALU (.c_out(c_out_slt), .a(in1_val[N-1:0]), .b(in2_val[N-1:0]));
		
		always @(*) begin
			case(mux_in)
				3'b000: 
			
				3'b001:	
        end		

endmodule