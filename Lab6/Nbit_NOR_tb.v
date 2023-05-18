`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2023 02:04:53 PM
// Design Name: 
// Module Name: Nbit_NOR_tb
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


module Nbit_NOR_tb(
    );
    parameter x = 32;
    reg [x-1:0] in1;
    reg [x-1:0] in2;
    wire [x-1:0] out;
    
    NBit_NOR #(x) norTest (.in1_val(in1), .in2_val(in2), .out_val(out));
    
    initial begin
    in1=0;
    in2=0;
    #200;
    in1 = 32'b11111111111111111111111111111111;
    in2 = 32'b0;
    #200;
    in1 = 32'b0;
    in2 = 32'b11111111111111111111111111111111;
    #200;
    in1 = 32'b11111111111111111111111111111111;
    in2 = 32'b11111111111111111111111111111111;
    #200;
    end
endmodule
