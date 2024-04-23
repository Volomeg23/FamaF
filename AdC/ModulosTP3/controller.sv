// CONTROLLER

module controller(input logic [10:0] instr,
						input logic reset, ExtIRQ, ExcAck, 
						output logic [1:0] AluSrc,
						output logic [3:0] AluControl, EStatus,				
						output logic reg2loc, regWrite, Branch,
											memtoReg, memRead, memWrite,Exc,
											ERet,ExtlAck,Unconditional);
											
	logic [1:0] AluOp_s;
	logic NotAnInstr;
											
	maindec 	decPpal 	(.Op(instr),
									.reset(reset),
									.reg2loc(reg2loc), 
									.regWrite(regWrite), 
									.AluSrc(AluSrc), 
									.Branch(Branch),
									.ALUOp(AluOp_s),
									.memtoReg(memtoReg), 
									.memRead(memRead), 
									.memWrite(memWrite),
									.ERet(ERet),
									.ExcAck(ExcAck),
									.ExtIRQ(ExtIRQ),
									.NotAnInstr(NotAnInstr),
									.Unconditional(Unconditional));	
					
								
	aludec 	decAlu 	(.funct(instr), 
							.aluop(AluOp_s), 
							.AluControl(AluControl));
							
			always_comb
			begin
				if(ExtIRQ)
					EStatus = 4'b0001;
				else if (NotAnInstr) 
					EStatus = 4'b0010;
				else 
							EStatus = 4'b0000;
			end
			
				assign ExtlAck = ExcAck & ExtIRQ;
				assign Exc = ExtIRQ | NotAnInstr;
			
endmodule