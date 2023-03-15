`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 03:51:19 PM
// Design Name: 
// Module Name: NBit_Register
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


module NBit_Register(out0,in0,clk);
    
    parameter n=32;
    input [n-1:0] in0;
    output [n-1:0] out0;
    input clk;
    
    genvar i;
    
    generate 
    for(i=0;i<n;i=i+1) begin: registerblk 
        dff Dflipflop(out0[i],in0[i],clk);
    end
    endgenerate   
    
endmodule
