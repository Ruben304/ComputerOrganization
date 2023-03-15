`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 09:52:10 PM
// Design Name: 
// Module Name: Nbit_NAND
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


module Nbit_NAND#(parameter N = 32)(in1_val, in2_val, out_val);
    input [N-1:0] in1_val;
    input [N-1:0] in2_val;
    output [N-1:0] out_val;  
    
    wire [N-1:0] a_out;
    
    Nbit_AND #(.N(N)) and1(.out_val(a_out), .in1_val(in1_val), .in2_val(in2_val));
    Nbit_NOT #(.N(N)) not1(.out(out_val), .in(a_out));
     
endmodule
