`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:43:58 PM
// Design Name: 
// Module Name: thirtytwo_bitadderD
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


module thirtytwo_bitadderD(a, b, c_in, c_out, sum);
    input [31:0] a;
    input [31:0] b;
    input c_in;
    output c_out;
    output [31:0] sum;
    wire fa1_out;
    
    sixteen_bitadderD SFA1D(.c_out(fa1_out), .sum(sum[15:0]), .a(a[15:0]), .b(b[15:0]), .c_in(c_in));
    sixteen_bitadderD SFA2D(.c_out(c_out), .sum(sum[31:16]), .a(a[31:16]), .b(b[31:16]), .c_in(fa1_out));
    
endmodule
