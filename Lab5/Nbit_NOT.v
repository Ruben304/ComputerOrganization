`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 08:37:29 PM
// Design Name: 
// Module Name: Nbit_NOT
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


module Nbit_NOT#(parameter N = 32)(in_val, out_val);
    input in_val;
    output out_val;
    genvar i;
    
    generate
        for (i = 0; i < N; i = i+ 1) begin 
            not n_gate(out_val[i], in_val[i]);
        end 
    endgenerate
endmodule
