`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 03:56:13 PM
// Design Name: 
// Module Name: NBit_Register_tb
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


module NBit_Register_tb(

    );
    
    parameter n=32;
    reg [n-1:0]d;
    reg clk;
    
    wire[n-1:0]q;
    
    NBit_Register #(n) registerTest(.out0(q), .in0(q), .clk(clk) );
    
    
    initial begin
    d=0;
    clk=0;
    
    #100;
    
    end 
   
    always 
    #5 clk=~clk;
   
    always #20 d=d+1;
   
       
endmodule


