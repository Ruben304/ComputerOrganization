`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 05:17:55 PM
// Design Name: 
// Module Name: Verification_4bits
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


module Verification_4bits(
input [3:0] a,
input [3:0] b,
input c_in,
output c_out,
output [3:0] sum
);

assign {c_out, sum} = a + b + c_in;

endmodule
