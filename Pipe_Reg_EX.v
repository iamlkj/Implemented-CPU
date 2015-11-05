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
module Pipe_Reg_EX(
               clk_i,
					
					data_i_RegWrite,
										
					data_i_Branch,
					data_i_Jump,
					data_i_MemWrite,
					data_i_MemRead,
					data_i_MemtoReg,
					
					data_i_add_branch,
					data_i_Zero,
					data_i_ALUout,
					data_i_RT_data,
					data_i_Write,
					EX_flush,
					
					
					
					
					data_o_RegWrite,
					data_o_Branch,
					data_o_Jump,
					data_o_MemWrite,
					data_o_MemRead,
					data_o_MemtoReg,
					
					data_o_add_branch,
					data_o_Zero,
					data_o_ALUout,
					data_o_RT_data,
					data_o_Write
					
					);
					
parameter size = 32;

input                    clk_i;		  

input		data_i_RegWrite;

input		data_i_Branch;
input		data_i_Jump;
input		data_i_MemWrite;
input		data_i_MemRead;
input		data_i_MemtoReg;
					
input		[size-1:0]		data_i_add_branch;
input		data_i_Zero;
input    [size-1:0] data_i_ALUout;
input		[size-1:0]		data_i_RT_data;
input		[5-1:0]		data_i_Write;
input		EX_flush;					

//output

output reg		data_o_RegWrite;

output reg		data_o_Branch;
output reg		data_o_Jump;
output reg		data_o_MemWrite;
output reg		data_o_MemRead;
output reg		data_o_MemtoReg;
					
					
output reg		[size-1:0]		data_o_add_branch;
output reg		data_o_Zero;
output reg     [size-1:0] data_o_ALUout;
output reg		[size-1:0]		data_o_RT_data;
output reg		[5-1:0]		data_o_Write;
					 
	  
always @(posedge clk_i) begin
    if(EX_flush)
	 begin
	 data_o_RegWrite<=0;
	
	 data_o_Branch<=0;
    data_o_Jump<=0;
	 data_o_MemWrite<=0;
	 data_o_MemRead<=0;
	 data_o_MemtoReg<=0;
					
	 data_o_add_branch<=0;
	 data_o_Zero<=0;
	 data_o_ALUout<=0;
	 data_o_RT_data<=0;
	 data_o_Write<=0;
	 end
	 
	 else
	 begin
	 data_o_RegWrite<=data_i_RegWrite;
	
	 data_o_Branch<=data_i_Branch;
    data_o_Jump<=data_i_Jump;
	 data_o_MemWrite<=data_i_MemWrite;
	 data_o_MemRead<=data_i_MemRead;
	 data_o_MemtoReg<=data_i_MemtoReg;
					
	 data_o_add_branch<=data_i_add_branch;
	 data_o_Zero<=data_i_Zero;
	 data_o_ALUout<=data_i_ALUout;
	 data_o_RT_data<=data_i_RT_data;
	 data_o_Write<=data_i_Write;	 
	 end
end

endmodule	