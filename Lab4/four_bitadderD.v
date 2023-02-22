`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:49:01 PM
// Design Name: 
// Module Name: four_bitadderD
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


module four_bitadderD(a, b, c_in, c_out, sum);
    input [3:0] a;
    input [3:0] b;
    input c_in;
    output c_out;
    output [3:0] sum;
    wire fa1_out, fa2_out, fa3_out;
    
    FA_strD FA1D(fa1_out, sum[0], a[0], b[0], c_in);
    FA_strD FA2D(fa2_out, sum[1], a[1], b[1], fa1_out);
    FA_strD FA3D(fa3_out, sum[2], a[2], b[2], fa2_out);
    FA_strD FA4D(c_out, sum[3], a[3], b[3], fa3_out);
endmodule
