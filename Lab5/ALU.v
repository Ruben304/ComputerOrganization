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

module ALU #(parameter N = 32)(in1_val, in2_val, mux_in, c_in, out1_val, c_out, clk);

	input [N-1:0] in1_val, in2_val;
	input [2:0] mux_in;
	input c_in, clk;
	output reg [N-1:0] out1_val;
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
	wire c_out_add, c_out_sub, c_out_slt;
	reg c_out_output;
	
	
		Nbit_NOT #(.N(N)) notALU (.out(not_out[N-1:0]), .in(in1_val[N-1:0]));
		
		NBit_adder #(.N(N)) adderALU (.c_out(c_out_add), .sum(add_out[N-1:0]), .a(in1_val[N-1:0]), .b(in2_val[N-1:0]), .c_in(c_in));
		
		NBit_NOR #(.N(N)) norALU (.out_val(nor_out[N-1:0]), .in1_val(in1_val[N-1:0]), .in2_val(in2_val[N-1:0]));
		
		Nbit_Sub #(.N(N)) subALU (.c_out(c_out_sub), .sum(sub_out[N-1:0]), .a(in1_val[N-1:0]), .b(in2_val[N-1:0]), .c_in(c_in));
		
		Nbit_NAND #(.N(N)) nandALU (.out_val(nand_out[N-1:0]), .in1_val(in1_val[N-1:0]), .in2_val(in2_val[N-1:0]));
		
		Nbit_AND #(.N(N)) andALU (.out_val(and_out[N-1:0]), .in1_val(in1_val[N-1:0]), .in2_val(in2_val[N-1:0]));
		
		Nbit_SLT #(.N(N)) sltALU (.c_out(c_out_slt), .a(in1_val[N-1:0]), .b(in2_val[N-1:0]));
		
		always @(*) begin
			case(mux_in)
				3'b000: // mov
			         out1_val[N-1:0] = mov_out[N-1:0];
				3'b001:	// not
				    out1_val[N-1:0] = not_out[N-1:0];
				3'b010: // add
				    begin
				        out1_val[N-1:0] = add_out[N-1:0];
				        c_out_output = c_out_add;
				    end    
				3'b011: // nor
				    out1_val[N-1:0] = nor_out[N-1:0];
				3'b100: // sub
				    begin
				        out1_val[N-1:0] = sub_out[N-1:0];
				        c_out_output = c_out_sub;
				    end
				3'b101: // nand
				    out1_val[N-1:0] = nand_out[N-1:0]; 
				3'b110: // and
				    out1_val[N-1:0] = and_out[N-1:0];
				3'b111: // slt
				    c_out_output = c_out_slt;
		    endcase
        end		

    assign c_out = c_out_output;

    NBit_Register #(.N(N)) regALU (.out0(out1_val[N-1:0]), .in0(output1[N-1:0]), .clk(clk));

    dff dffALU (.q(c_out), .d(c_out), .clk(clk));


endmodule
