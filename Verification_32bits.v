`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:07:25 PM
// Design Name: 
// Module Name: Verification_32bits
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


module Verification_32bits(
input [31:0] a,
input [31:0] b,
input c_in,
output c_out,
output [31:0] sum
);

assign {c_out, sum} = a + b + c_in;

    
endmodule
