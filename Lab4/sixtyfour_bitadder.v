`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:22:41 PM
// Design Name: 
// Module Name: sixtyfour_bitadder
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


module sixtyfour_bitadder(a, b, c_in, c_out, sum);
    input [63:0] a;
    input [63:0] b;
    input c_in;
    output c_out;
    output [63:0] sum;
    wire fa1_out;
    
    thirtytwo_bitadder SFA1(.c_out(fa1_out), .sum(sum[31:0]), .a(a[31:0]), .b(b[31:0]), .c_in(c_in));
    thirtytwo_bitadder SFA2(.c_out(c_out), .sum(sum[63:31]), .a(a[63:31]), .b(b[63:31]), .c_in(fa1_out));
    
endmodule