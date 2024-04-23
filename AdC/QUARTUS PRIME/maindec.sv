module maindec (input logic [0:10] Op,
					output logic Reg2Loc,
					output logic ALUSrc,
					output logic MemtoReg,
					output logic RegWrite,
					output logic MemRead,
					output logic MemWrite,
					output logic Branch,
					output logic [0:1] ALUOp);
					
			always_comb 
				begin
					casez(Op)
					11'b111_1100_0010: begin //LDUR
							Reg2Loc <= 1'bx;
							ALUSrc <= 1'b1;
							MemtoReg <= 1'b1;
							RegWrite <= 1'b1;
							MemRead <= 1'b1;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'b00;
						end
					11'b111_1100_0000: begin // STUR
							Reg2Loc <= 1'b1;
							ALUSrc <= 1'b1;
							MemtoReg <= 1'bx;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b1;
							Branch <= 1'b0;
							ALUOp <= 2'b00;
					
						end
					11'b101_1010_0???: begin //CBZ
						Reg2Loc = 1'b1;
						ALUSrc = 1'b0;
						MemtoReg = 1'bx;
						RegWrite = 1'b0;
						MemRead = 1'b0;
						MemWrite = 1'b0;
						Branch = 1'b1;
						ALUOp = 2'b01;
						
					
						end
					11'b100_0101_1000,11'b110_0101_1000,11'b100_0101_0000,11'b101_0101_0000: begin // R-Format
							Reg2Loc <= 1'b0;
							ALUSrc <= 1'b0;
							MemtoReg <= 1'b0;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'b10;
									
						end
					default: begin
							Reg2Loc <= 1'b0;
							ALUSrc <= 1'b0;
							MemtoReg <= 1'b0;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							ALUOp <= 2'b00;
					
						end
						
					endcase
					
				end
endmodule