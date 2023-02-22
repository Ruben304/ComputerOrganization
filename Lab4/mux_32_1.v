`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 04:18:49 PM
// Design Name: 
// Module Name: mux_32_1
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


module mux_32_1(a,b,c1_in,c2_in,select,out,sum);
    input [31:0] a;
    input [31:0] b;
    input c1_in;
    input c2_in;
    input select;
    output reg [31:0] sum;
    output reg out;
    
    always @(*) begin 
        if (select) begin 
                out = c1_in;
                sum = a;
             end
         else begin
                out = c2_in;
                sum = b;
             end
    end  
endmodule
