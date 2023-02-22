`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:41:03 PM
// Design Name: 
// Module Name: sixtyfour_bitadderD
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


module sixtyfour_bitadderD(a, b, c_in, c_out, sum);
    input [63:0] a;
    input [63:0] b;
    input c_in;
    output c_out;
    output [63:0] sum;
    wire fa1_out;
    
    thirtytwo_bitadderD SFA1D(.c_out(fa1_out), .sum(sum[31:0]), .a(a[31:0]), .b(b[31:0]), .c_in(c_in));
    thirtytwo_bitadderD SFA2D(.c_out(c_out), .sum(sum[63:32]), .a(a[63:32]), .b(b[63:32]), .c_in(fa1_out));
    
endmodule
