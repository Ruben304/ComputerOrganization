`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 09:56:43 PM
// Design Name: 
// Module Name: forwardingmux
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


module forwardingmux(EX_MEM_Rd, MEM_WB_Rd, ID_EX_Rs, ID_EX_Rt, EX_MEM_RegWrite, EX_MEM_MemWrite, MEM_WB_RegWrite, forwardA, forwardB);
    input [4:0] EX_MEM_Rd, MEM_WB_Rd, ID_EX_Rs, ID_EX_Rt;
    input EX_MEM_RegWrite, MEM_WB_RegWrite, EX_MEM_MemWrite;
    output [1:0] forwardA,forwardB;
    
    assign forwardA = ((EX_MEM_Rd == ID_EX_Rs) && EX_MEM_RegWrite) ? 2'b10 : ((MEM_WB_Rd == ID_EX_Rs) && MEM_WB_RegWrite) ? 2'b01 : 2'b00;
    assign forwardB = ((EX_MEM_Rd == ID_EX_Rt) && (EX_MEM_MemWrite || EX_MEM_RegWrite)) ? 2'b10 : ((MEM_WB_Rd == ID_EX_Rt) && MEM_WB_RegWrite) ? 2'b01 : 2'b00;
    
endmodule
