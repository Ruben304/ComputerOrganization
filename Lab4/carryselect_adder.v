`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 04:18:54 PM
// Design Name: 
// Module Name: carryselect_adderD
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


module carryselect_adder(a, b, c_in, c_out, sum);

input [63:0] a;
input [63:0] b;
input c_in;
output c_out;
output [63:0] sum;

wire [31:0] tt1_sum, tt2_sum;
wire input_out, tt1_out, tt2_out;

thirtytwo_bitadder TTB1 (.c_out(input_out), .sum(sum[31:0]), .a(a[31:0]), .b(b[31:0]), .c_in(c_in));
thirtytwo_bitadder TTB2 (.c_out(tt1_out), .sum(tt1_sum[31:0]), .a(a[31:0]), .b(b[31:0]), .c_in(0));
thirtytwo_bitadder TTB3 (.c_out(tt2_out), .sum(tt1_sum[31:0]), .a(a[31:0]), .b(b[31:0]), .c_in(1));

mux_32_1 mux32(.out(c_out), .sum(sum[63:32]), .a(tt1_sum[31:0]), .b(tt2_sum[31:0]), .select(input_out), .c1_in(tt1_out), .c2_in(tt2_out));

endmodule
