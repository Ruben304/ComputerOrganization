`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 10:24:01 PM
// Design Name: 
// Module Name: Nbit_SLT
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


module Nbit_SLT#(parameter N = 32)(a,b,c_out);
    input [N-1:0] a;
    input [N-1:0] b;
    output reg c_out;

    wire [N-1:0] d;
    
    assign d = a - b; 
    
    always @(*) begin
        if (a == b) // a and b is same 
            c_out <= 1'b0;
        else if(a[N-1] == 0 && b[N-1] == 1) // a is pos. and b is neg.
            c_out <= 1'b0;
        else if(a[N-1] == 1 && b[N-1] == 0) // b is pos and a is neg.
            c_out <= 1'b1;
        else    // a and b be the same size 
            c_out <= d[N-1]; //grabbing from msb
    end 
endmodule
