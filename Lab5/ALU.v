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

module ALU #(parameter N = 32)(R2, R3, ALUOp, c_in, c_out_output, clk, R1);
	input [N-1:0] R2, R3;
	input [2:0] ALUOp;
	input c_in, clk;
	output c_out_output;
	output reg [N-1:0] R1;
	
    
	wire [N-1:0] mov_out;
	wire [N-1:0] not_out;
	wire [N-1:0] add_out;
	wire [N-1:0] nor_out;
	wire [N-1:0] sub_out;
	wire [N-1:0] nand_out;
	wire [N-1:0] and_out;
	wire [N-1:0] slt_out;

	wire c_out_add, c_out_sub, c_out_slt;
	reg c_out_output;
	
	    assign mov_out[N-1:0] = R2 [N-1:0];
	   
		Nbit_NOT #(.N(N)) notALU (.out(not_out[N-1:0]), .in(R2[N-1:0]));
		
		Nbit_adder #(.N(N)) adderALU (.c_out(c_out_add), .sum(add_out[N-1:0]), .a(R2[N-1:0]), .b(R3[N-1:0]), .c_in(c_in));
		
		NBit_NOR #(.N(N)) norALU (.out_val(nor_out[N-1:0]), .in1_val(R2[N-1:0]), .in2_val(R3[N-1:0]));
		
		Nbit_Sub #(.N(N)) subALU (.c_out(c_out_sub), .sum(sub_out[N-1:0]), .a(R2[N-1:0]), .b(R3[N-1:0]), .c_in(0));
		
		Nbit_NAND #(.N(N)) nandALU (.out_val(nand_out[N-1:0]), .in1_val(R2[N-1:0]), .in2_val(R3[N-1:0]));
		
		Nbit_AND #(.N(N)) andALU (.out_val(and_out[N-1:0]), .in1_val(R2[N-1:0]), .in2_val(R3[N-1:0]));
		
		Nbit_SLT #(.N(N)) sltALU (.c_out(c_out_slt), .a(R2[N-1:0]), .b(R3[N-1:0]));
		
		always @(*) begin
			case(ALUOp)
				3'b000: // mov
			         begin
			             R1[N-1:0] = mov_out[N-1:0];
			             c_out_output = 0;
			         end
				3'b001:	// not
				    begin
				        R1[N-1:0] = not_out[N-1:0];
				        c_out_output = 0;
			         end
				3'b010: // add
				    begin
				        R1[N-1:0] = add_out[N-1:0];
				        c_out_output = c_out_add;
				    end    
				3'b011: // nor
				    begin
				        R1[N-1:0] = nor_out[N-1:0];
				        c_out_output = 0;
			        end
				3'b100: // sub
				    begin
				        R1[N-1:0] = sub_out[N-1:0];
				        c_out_output = c_out_sub;
				    end
				3'b101: // nand
				    begin
				        R1[N-1:0] = nand_out[N-1:0]; 
				        c_out_output = 0;
			         end
				3'b110: // and
				    begin
				        R1[N-1:0] = and_out[N-1:0];
				        c_out_output = 0;
			         end
				3'b111: // slt
				    c_out_output = c_out_slt;
		    endcase
        end		


endmodule
