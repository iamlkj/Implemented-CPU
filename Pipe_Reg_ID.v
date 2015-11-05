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
module Pipe_Reg_ID(
                    clk_i,
					data_i_ALUop,
					data_i_RegWrite,
					data_i_ALUSrc,
					data_i_RegDst,
					data_i_Branch,
					data_i_Jump,
					data_i_MemWrite,
					data_i_MemRead,
					data_i_MemtoReg,
					
					data_i_add,
					data_i_RSdata,
					data_i_RTdata,
					data_i_SE_OUT,
					
					data_i_RS,
					data_i_RT,
					data_i_RD,
					
					
					data_o_ALUop,
					data_o_RegWrite,
					data_o_ALUSrc,
					data_o_RegDst,
					data_o_Branch,
					data_o_Jump,
					data_o_MemWrite,
					data_o_MemRead,
					data_o_MemtoReg,
					
					data_o_add,
					data_o_RSdata,
					data_o_RTdata,
					data_o_SE_OUT,
					
					data_o_RS,
					data_o_RT,
					data_o_RD
					
					);
								
parameter size = 32;
//input
input     clk_i;
		  
input    [3-1:0]      data_i_ALUop;
input		data_i_RegWrite;
input		data_i_ALUSrc;
input		data_i_RegDst;
input		data_i_Branch;
input		data_i_Jump;
input		data_i_MemWrite;
input		data_i_MemRead;
input		data_i_MemtoReg;
					
input		[size-1:0]		data_i_add;
input		[size-1:0]		data_i_RSdata;
input		[size-1:0]		data_i_RTdata;
input		[size-1:0]		data_i_SE_OUT;

input		[5-1:0]	data_i_RS;					
input		[5-1:0]	data_i_RT;
input		[5-1:0]	data_i_RD;

//output
output reg   [3-1:0]      data_o_ALUop;
output reg		data_o_RegWrite;
output reg		data_o_ALUSrc;
output reg		data_o_RegDst;
output reg		data_o_Branch;
output reg		data_o_Jump;
output reg		data_o_MemWrite;
output reg		data_o_MemRead;
output reg		data_o_MemtoReg;
					
output reg		[size-1:0]		data_o_add;
output reg		[size-1:0]		data_o_RSdata;
output reg		[size-1:0]		data_o_RTdata;
output reg		[size-1:0]		data_o_SE_OUT;

output reg		[5-1:0]	data_o_RS;	 					
output reg		[5-1:0]	data_o_RT;
output reg		[5-1:0]	data_o_RD;	  
	  
	  
	  
	  
	  
	  
	  
always @(posedge clk_i) begin
    
    data_o_ALUop<=data_i_ALUop;
	 data_o_RegWrite<=data_i_RegWrite;
	 data_o_ALUSrc<=data_i_ALUSrc;
	 data_o_RegDst<=data_i_RegDst;
	 data_o_Branch<=data_i_Branch;
    data_o_Jump<=data_i_Jump;
	 data_o_MemWrite<=data_i_MemWrite;
	 data_o_MemRead<=data_i_MemRead;
	 data_o_MemtoReg<=data_i_MemtoReg;
					
	 data_o_add<=data_i_add;
	 data_o_RSdata<=data_i_RSdata;
	 data_o_RTdata<=data_i_RTdata;
    data_o_SE_OUT<=data_i_SE_OUT;
	
    data_o_RS<=data_i_RS;	
	 data_o_RT<=data_i_RT;
	 data_o_RD<=data_i_RD;	  	 
	 
 
	 
end

endmodule	