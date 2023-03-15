`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 06:33:38 PM
// Design Name: 
// Module Name: NBit_NOR
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


module NBit_NOR #(parameter N = 32)(in1_val, in2_val, out_val);

    input [N-1:0] in1_val;
    input [N-1:0] in2_val;
    output [N-1:0] out_val;  
    
    wire [N-1:0] o_out; 
    
    NBit_OR #(.N(N)) or1(.out_val(o_out), .in1_val(in1_val), .in2_val(in2_val));
    Nbit_NOT #(.N(N)) not1(.out(out_val), .in(o_out));

endmodule
