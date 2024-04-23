module maindec(
		input logic [10:0] Op, 
		input logic ExtIRQ, reset, ExcAck,
		output logic reg2loc, memtoReg, regWrite, memRead, memWrite, Branch, ERet, NotAnInstr, Unconditional,
		output logic [1:0] AluSrc, 
		output logic [1:0] ALUOp
	);

always_comb  // PREGUNTAR
			if (reset) begin
							reg2loc <= 1'b0;
							AluSrc <= 2'b00;
							memtoReg <= 1'b0;
							regWrite <= 1'b0;
							memRead <= 1'b0;
							memWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'b00;
							NotAnInstr <= 1'b0;
							ERet <= 1'b0;
							Unconditional <= 1'b0;
						end
				else
				begin
					casez(Op)
					11'b111_1100_0010: begin //LDUR
							reg2loc <= 1'b0;
							AluSrc <= 2'b01;
							memtoReg <= 1'b1;
							regWrite <= 1'b1;
							memRead <= 1'b1;
							memWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'b00;
							NotAnInstr <= 1'b0;
							ERet <= 1'b0;
							Unconditional <= 1'b0;
						end
					11'b111_1100_0000: begin // STUR
							reg2loc <= 1'b1;
							AluSrc <= 2'b01;
							memtoReg <= 1'bx;
							regWrite <= 1'b0;
							memRead <= 1'b0;
							memWrite <= 1'b1;
							Branch <= 1'b0;
							ALUOp <= 2'b00;
							NotAnInstr <= 1'b0;
							ERet <= 1'b0;
							Unconditional <= 1'b0;
					
						end
					11'b101_1010_0???: begin //CBZ
						reg2loc = 1'b1;
						AluSrc = 2'b00;
						memtoReg = 1'bx;
						regWrite = 1'b0;
						memRead = 1'b0;
						memWrite = 1'b0;
						Branch = 1'b1;
						ALUOp = 2'b01;
						NotAnInstr <= 1'b0;
						ERet <= 1'b0;
						Unconditional <= 1'b0;
						end
						11'b110_1011_0100: begin //ERET
						reg2loc = 1'b0;
						AluSrc = 2'b00;
						memtoReg = 1'bx;
						regWrite = 1'b0;
						memRead = 1'b0;
						memWrite = 1'b0;
						Branch = 1'b1;
						ALUOp = 2'b01;
						NotAnInstr <= 1'b1;
						ERet <= 1'b1;
						Unconditional <= 1'b0;
						end
						11'b110_1010_1001: begin //MRS
						reg2loc = 1'b1;
						AluSrc = 2'b1x;
						memtoReg = 1'bx;
						regWrite = 1'b0;
						memRead = 1'b0;
						memWrite = 1'b0;
						Branch = 1'b1;
						ALUOp = 2'b01;
						NotAnInstr <= 1'b0;
						ERet <= 1'b0;
						Unconditional <= 1'b0;
						end
					11'b100_0101_1000,11'b110_0101_1000,11'b100_0101_0000,11'b101_0101_0000: begin // R-Format
							reg2loc <= 1'b0;
							AluSrc <= 2'b0;
							memtoReg <= 1'b0;
							regWrite <= 1'b1;
							memRead <= 1'b0;
							memWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'b10;
							NotAnInstr <= 1'b0;
							ERet <= 1'b0;
							Unconditional <= 1'b0;
						end
						11'b110_1011_0000: begin // BR
							reg2loc <= 1'b0;
							AluSrc <= 2'b00;
							memtoReg <= 1'b0;
							regWrite <= 1'b0;
							memRead <= 1'b0;
							memWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'b01;
							NotAnInstr <= 1'b0;
							ERet <= 1'b0;
							Unconditional <= 1'b1;
							end
					default:
						begin
							reg2loc <= 1'bx;
							AluSrc <= 1'bx;
							memtoReg <= 1'b0;
							regWrite <= 1'b0;
							memRead <= 1'b0;
							memWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'bxx;
							NotAnInstr <= 1'b1;
							ERet <= 1'b0;
							Unconditional <= 1'b0;
						end
					endcase
				end
					

				
				assign ExtlAck = ExcAck & ExtIRQ;
				
				assign Exc = ExtIRQ | NotAnInstr;
					

endmodule