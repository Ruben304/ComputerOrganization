`timescale 1ns / 1ns

module Verification_RegAdder(c_out,sum, a,b,c_in, select,clk);
parameter n=32;
input [n-1:0] a;
input [n-1:0] b;
input c_in;
input clk;
output reg c_out;
output reg [n-1:0] sum;
input select;

wire [n-1:0] sum_temp;
wire c_out_temp;

assign {c_out_temp, sum_temp}= a+b+c_in;

always @(posedge clk)begin
c_out<=c_out_temp;
sum<=(select)?~a : sum_temp;
end
endmodule

