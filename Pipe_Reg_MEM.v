//Subject:     CO project 4 - Pipe Register
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Pipe_Reg_MEM(
               clk_i,
					data_i_RegWrite,
		         data_i_MemtoReg,
					data_i_final,
					data_i_ALU_out,
					data_i_WriteReg,
					
					
					data_o_RegWrite,
					data_o_MemtoReg,
					data_o_final,
					data_o_ALU_out,
					data_o_WriteReg
					);
					
parameter size = 32;

input                    clk_i;		
input      data_i_RegWrite;  
input      data_i_MemtoReg;
input      [size-1: 0] data_i_final;
input      [size-1: 0] data_i_ALU_out;  
input      [5-1: 0] data_i_WriteReg;


output reg             data_o_RegWrite;  
output reg             data_o_MemtoReg;
output reg     [size-1: 0] data_o_final;
output reg     [size-1: 0] data_o_ALU_out;  
output reg     [5-1: 0]    data_o_WriteReg;
	  
always @(posedge clk_i) begin
   
	            data_o_RegWrite<= data_i_RegWrite;
					data_o_MemtoReg<=data_i_MemtoReg;
					data_o_final<=data_i_final;
					data_o_ALU_out<=data_i_ALU_out;
					data_o_WriteReg<=data_i_WriteReg;
	
	
end

endmodule	