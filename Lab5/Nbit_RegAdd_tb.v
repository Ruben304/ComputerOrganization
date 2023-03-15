`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 04:41:15 PM
// Design Name: 
// Module Name: Nbit_RegAdd_tb
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


module Nbit_RegAdd_tb(

    );

parameter x = 8;
reg [x-1:0] a;
reg [x-1:0] b;
reg c_in;
reg clk;
reg select;
wire c_out;
wire [x-1:0] result;
wire c_out_verify;
wire [x-1:0] sum_verify;
wire error_flag;

Nbit_RegAdd #(.n(x)) RegAdder(.c_in(c_in), .a(a), .c_out(c_out), .sum(result), .select(select), .b(b), .clk(clk));

Verification_RegAdder #(.n(x)) Verfiy(.c_out(c_out_verify), .sum(sum_verify), .a(a), .b(b), .c_in(c_in), .select(select), .clk(clk));

assign error_flag = (c_out != c_out_verify || result != sum_verify);

always@(posedge clk) begin
    if(error_flag == 1'b1)
    $display("Error occurs when a = %d, b = %d, c_in = %d, select = %d\n",a, b, c_in, select);
end

initial begin
c_in = 0;
a = 0;
a = 3'd7;
b = 0;
clk = 0;
select = 0;
end

always #5 clk = ~clk;

always@(posedge clk) begin
    {c_in, a, b, select} <= {c_in, a, b, select} + 1'b1;
end

endmodule