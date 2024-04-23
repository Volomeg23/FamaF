module fetch #(parameter N=64)
			  (input logic PCSrc_F, clk, reset, EProc_F, Unconditional, readData1_F,
			   input logic [N-1:0] PCBranch_F, EVAddr_F,
			   output logic[N-1:0] imem_addr_F, NextPC_F);

	logic [N-1:0] PC_out, adder_out, mux1_out, mux2_out, muxB_out;

	flopr #(N) PC   (clk, reset, mux2_out, PC_out);
	adder #(N) Add  (PC_out, 64'h4, adder_out);
	mux2  #(N) MUX1 (adder_out, PCBranch_F, PCSrc_F, mux1_out);
	mux2 #(N) MUX_B (mux1_out,readData1_F,Unconditional,muxB_out); // aluResult toma el segundo registro, saco cable de readData1 y lo meto al mux
	mux2  #(N) MUX2 (muxB_out, EVAddr_F, EProc_F, mux2_out);

	assign imem_addr_F = PC_out;
	assign NextPC_F = mux1_out;
endmodule
