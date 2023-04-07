module hazardunit(IFIDWrite,PCWrite,HazardMux, IDEX_Rs, IDEX_Rt, IDEX_Rd, EXMEM_Rd, inWex, inWmem, ALUOp);
    input [4:0] IDEX_Rs, IDEX_Rt, IDEX_Rd, EXMEM_Rd;
    input inWex, inWmem;
	output reg IFIDWrite, PCWrite, HazardMux;
	
    always @(*) begin
	    if (inWex && (IDEX_Rd == IDEX_Rs || (IDEX_Rd == IDEX_Rt && ALUOp != 2'b11 && ALUOp != 2'b00)) && IDEX_Rd != 0) begin // 1 ahead hazards
		  IFIDWrite = 0; 
		  PCWrite = 0;
		  HazardMux = 1;
        end else if (inWmem && (EXMEM_Rd == IDEX_Rs || EXMEM_Rd == IDEX_Rt) && EXMEM_Rd != 0) begin // 2 ahead hazards
          assign IFIDWrite = 0; 
		  PCWrite = 0;
		  HazardMux = 1;
		end else begin  // no hazard detected
		  IFIDWrite = 1; 
		  PCWrite = 1;
		  HazardMux = 0;
	    end
     end
            
endmodule
