`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 09:41:22 PM
// Design Name: 
// Module Name: Nbit_Sub_tb
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

module Nbit_Sub_tb(

    );
    
    parameter N = 32; 
    
    reg [N-1:0] in1; 
    reg [N-1:0] in2; 
    reg c_in; 
    
    wire [N-1:0] sum; 
    wire c_out; 
    
    
    Nbit_Sub #(.N(N)) subTest(.c_out(c_out),.sum(sum), .a(in1), .b(in2), .c_in(c_in)); 
 
    initial begin 
        
        in1 = 0; 
        in2 = 0; 
        c_in = 0; 
        
        #100; 
    
    end 
    
    always 
        #2 {c_in, in1, in2} = {c_in, in1, in2} + 1;
        
endmodule
