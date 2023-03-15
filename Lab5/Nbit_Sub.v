`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 09:13:13 PM
// Design Name: 
// Module Name: Nbit_Sub
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


module Nbit_Sub #(parameter N = 32)(a, b, c_in, sum, c_out);
    input [N-1:0] a;
    input [N-1:0] b;
    input c_in;
    output c_out;
    output [N-1:0] sum;
    genvar i;
    
    wire [N-1:0] inv_b;
    wire [N:0] carry;
    
    assign carry[0] = c_in;
    assign c_out = carry[N];
    
    Nbit_NOT #(.N(N)) not1(.out(inv_b), .in(b));
    generate 
        for(i = 0; i < N; i = i + 1) begin 
            FA_str FA1 (.c_out(carry[i+1]), .sum(sum[i]), .a(a[i]), .b(inv_b[i]), .c_in(carry[i]));
         end 
    endgenerate
    
endmodule
