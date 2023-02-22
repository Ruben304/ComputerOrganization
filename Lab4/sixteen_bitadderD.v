`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:47:20 PM
// Design Name: 
// Module Name: sixteen_bitadderD
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


module sixteen_bitadderD(a, b, c_in, c_out, sum);
    input [15:0] a;
    input [15:0] b;
    input c_in;
    output c_out;
    output [15:0] sum;
    wire fa1_out, fa2_out, fa3_out;
    
    four_bitadderD FFA1D(.c_out(fa1_out), .sum(sum[3:0]), .a(a[3:0]), .b(b[3:0]), .c_in(c_in));
    four_bitadderD FFA2D(.c_out(fa2_out), .sum(sum[7:4]), .a(a[7:4]), .b(b[7:4]), .c_in(fa1_out));
    four_bitadderD FFA3D(.c_out(fa3_out), .sum(sum[11:8]), .a(a[11:8]), .b(b[11:8]), .c_in(fa2_out));
    four_bitadderD FFA4D(.c_out(c_out), .sum(sum[15:12]), .a(a[15:12]), .b(b[15:12]), .c_in(fa3_out));
endmodule