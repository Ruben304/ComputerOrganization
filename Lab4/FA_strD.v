`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:52:32 PM
// Design Name: 
// Module Name: FA_strD
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


module FA_strD(c_out, sum, a, b, c_in);

input		a, b, c_in; //declare inputs a, b and c_in, 1 bit each
output	c_out, sum; //declare outputs c_out and sum, 1 bit each
//declare wires for values being passed between different gates
wire		not_a, not_b, not_c;
wire		and1_out, and2_out, and3_out, and4_out, and5_out, and6_out, and7_out;


not	   not1		(not_a, a);
not	   not2		(not_b, b);
not	   not3		(not_c, c_in);

// get sum
AND_T_3_D		and1		(and1_out, a, not_b, not_c);
AND_T_3_D		and2		(and2_out, not_a, b, not_c);
AND_T_3_D	and3		(and3_out, not_a, not_b, c_in);
AND_T_3_D		and4		(and4_out, a, b, c_in);
OR_T_4_D		or1		(sum, and1_out, and2_out, and3_out, and4_out);

AND_T_2_D		and5		(and5_out, a, c_in);
AND_T_2_D		and6		(and6_out, b, c_in);
AND_T_2_D		and7		(and7_out, a, b);
OR_T_3_D		or2		(c_out, and5_out, and6_out, and7_out);


endmodule