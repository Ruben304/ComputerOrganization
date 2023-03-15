module Nbit_RegAdd(c_in, c_out,sum,a,b,clk, select);
parameter n=8;
input [n-1:0] a;
input [n-1:0] b;
input c_in;
input clk;
output c_out;
output [n-1:0] sum;
input select;
wire [n-1:0] sum_adder;
wire [n-1:0] sum_select;
wire c_adder;
wire [n-1:0] not_a_out;

Nbit_adder #(n) Adder (c_adder,sum_adder,a,b,c_in);
Nbit_NOT #(n) NOT (not_a_out,a);
assign sum_select=select ? not_a_out: sum_adder;
NBit_Register #(n) Sum_Reg(sum,sum_select,clk);
NBit_Register #(1) Cout_Reg(c_out,c_adder,clk);
endmodule 
