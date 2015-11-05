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
module Pipe_Reg(
                    clk_i,
					IF_flush,
					IF_Write,					
					data_i_1,
					data_i_2,
					data_o_1,
				   data_o_2
					
					);
					
parameter size = 32;

input                    clk_i;	 
input  IF_flush;
input  IF_Write;
input      [32-1: 0] data_i_1;
output reg [32-1: 0] data_o_1;
input      [32-1: 0] data_i_2;
output reg [32-1: 0] data_o_2;


	  
always @(posedge clk_i) begin
   if(IF_flush==1)
	begin
    data_o_1 <=0 ;
	 data_o_2 <= 0;
	 end
	 else if(IF_Write==1)
    begin
	 
    data_o_1 <= data_o_1;
	 data_o_2 <= data_o_2;	 	 
	 
	 end
	 else 
	 begin
	 data_o_1 <= data_i_1;
	 data_o_2 <= data_i_2;
	 end
end

endmodule	