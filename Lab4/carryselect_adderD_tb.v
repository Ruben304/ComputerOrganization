`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 05:17:55 PM
// Design Name: 
// Module Name: Verification_4bits
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


module carryselect_adderD_tb();

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;
	
	reg clk;

	// Outputs
	wire c_out;
	wire [63:0] sum;
	wire c_out_verify;
	wire [63:0] sum_verify;
	wire error_flag;


	// Instantiate the Unit Under Test (UUT)
	carryselect_adderD CarrySelectAdderD (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Verification module
	Verification_64bits Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag == 1'b1)
			// Use $display here instead of $monitor
			// $monitor will display the message whenever there's a change of a, b, c_in
			// $display will only display once when it's been executed
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		
		a = 64'd0;
		b = 64'd0;
		c_in = 1'd0;
		
		#100;
		
		a = 64'd1;
		b = 64'd1;
		c_in = 1'd1;
		
		#100;
		
		a = 64'd3;
		b = 64'd3;
		c_in = 1'd0;
		
		#100;
		
		a = 64'd0;
		b = 64'd0;
		c_in = 1'd1;


	end

    // Create all possible combinations of input
    always@(posedge clk)
        begin
        {c_in, a, b} = {c_in, a, b} + 1'b1;
        #100;
        end
      
endmodule
