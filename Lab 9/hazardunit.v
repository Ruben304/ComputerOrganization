module hazardunit(IDEX_rt, IFID_rs, IFID_rt, memread, IFIDWrite, PCWrite, HazardMux);
	input [4:0] IDEX_rt,IFID_rs,IFID_rt;
	input memread;
	output 	IFIDWrite, PCWrite, HazardMux;
	

	assign IFIDWrite = ((IDEX_rt == IFID_rt || IDEX_rt == IFID_rs) && memread) ? 0 : 1;
	assign PCWrite = ((IDEX_rt == IFID_rt || IDEX_rt == IFID_rs) && memread) ? 0 : 1;
	assign HazardMux = ((IDEX_rt == IFID_rt || IDEX_rt == IFID_rs) && memread) ? 1 : 0;
            
endmodule
