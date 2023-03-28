`timescale 1ns / 1ns

module control(
		input [5:0] instruction,
		output reg [2:0] ALUOp,
		output reg MemRead,
		output reg MemtoReg,
		output reg RegDst,
		output reg Branch, 
		output reg ALUSrc,
		output reg MemWrite,
		output reg RegWrite,
		output reg Jump,
		output reg BranchNE,
		output reg LUI
		);


always @(*) begin
		if (instruction == 6'b00_0000) begin				//RType might need edits 
		ALUOp = 3'b000;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b1;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		BranchNE = 1'b0;
		LUI = 1'b0;
		end else if (instruction == 6'b00_0100) begin   //branch
		ALUOp = 3'b001;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b1;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b0;
		BranchNE = 1'b0;
		LUI = 1'b0;
		end else if (instruction == 6'b10_1011) begin   // sw
		ALUOp = 3'b010;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
	 	MemWrite = 1'b1;
		RegWrite = 1'b0;
		Jump = 1'b0;
		BranchNE = 1'b0;
		LUI = 1'b0;
		end else if (instruction == 6'b10_0011) begin   // lw
		ALUOp = 3'b010;
		MemRead = 1'b1;
		MemtoReg = 1'b1;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		LUI = 1'b0;
		end else if (instruction == 6'b00_0010) begin   // j
		ALUOp = 3'b000; // dosent matter
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b1;
		BranchNE = 1'b0;
		LUI = 1'b0;
		end else if (instruction == 6'b00_0101) begin // bne
		ALUOp = 3'b001; 
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b0;
		BranchNE = 1'b1;
		LUI = 1'b0;
		end else if(instruction == 6'b00_1000) begin // addi
		ALUOp = 3'b011; 
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		BranchNE = 1'b0;
		LUI = 1'b0;
		end else if(instruction == 6'b00_1100) begin  //andi
		ALUOp = 3'b100;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		BranchNE = 1'b0;
		LUI = 1'b0;
		end else if(instruction == 6'b00_1111) begin  //lui
		ALUOp = 3'b010;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		BranchNE = 1'b0;
		LUI = 1'b1;
		end else begin // set all to 0
		ALUOp = 3'b000;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b0;
		BranchNE = 1'b0;
		LUI = 1'b0;
		end
	
	
end
endmodule
