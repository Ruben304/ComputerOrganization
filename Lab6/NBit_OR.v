`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 06:59:35 PM
// Design Name: 
// Module Name: NBit_OR
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


module NBit_OR #(parameter N = 32)(in1_val, in2_val, out_val);

    input [N-1:0] in1_val;
    input [N-1:0] in2_val;
    output [N-1:0] out_val;   
    
    genvar i;

    generate
        for (i = 0; i < N; i = i + 1) begin
            or or_gate(out_val[i], in1_val[i], in2_val[i]);
        end
    endgenerate

endmodule
