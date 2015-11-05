//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	Jump_o,
	MemWrite_o,
	MemRead_o,
	MemtoReg_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output         Jump_o;
output         MemWrite_o;
output         MemRead_o;
output         MemtoReg_o;

//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg            MemWrite_o;
reg            MemRead_o;
reg            Jump_o;
reg            MemtoReg_o;



//Parameter


//Main function
always @(instr_op_i) begin
	case(instr_op_i)
	    6'd8:begin
              RegWrite_o<=1;
				  ALU_op_o<=2'b00;  
				  ALUSrc_o<=1;
				  RegDst_o<=0;
				  Branch_o<=0;
			     Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end
		 6'd0:begin
              RegWrite_o<=1;
				  ALU_op_o<=2'b10;  
				  ALUSrc_o<=0;
				  RegDst_o<=1;
				  Branch_o<=0;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end	 
       6'd4:begin     //BEQ
              RegWrite_o<=0;
				  ALU_op_o<=2'b01;  
				  ALUSrc_o<=0;
				  RegDst_o<=0;
				  Branch_o<=1;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end
		 6'd5:begin      //BNE
              RegWrite_o<=0;
				  ALU_op_o<=3'b101;  
				  ALUSrc_o<=0;
				  RegDst_o<=0;
				  Branch_o<=1;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end		 
		 6'd10:begin
              RegWrite_o<=1;
				  ALU_op_o<=2'b10;  
				  ALUSrc_o<=1;
				  RegDst_o<=0;
				  Branch_o<=0;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end		
      6'd13:begin
              RegWrite_o<=1;
				  ALU_op_o<=3'b100;  
				  ALUSrc_o<=1;
				  RegDst_o<=0;
				  Branch_o<=0;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end		 		

      6'd15:begin
              RegWrite_o<=1;
				  ALU_op_o<=3'b011;  
				  ALUSrc_o<=1;
				  RegDst_o<=0;
				  Branch_o<=0;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end	

    6'b100011:begin // lw
              RegWrite_o<=1;
				  ALU_op_o<=3'b000;  
				  ALUSrc_o<=1;
				  RegDst_o<=0;
				  Branch_o<=0;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=1;
              MemtoReg_o<=1;

              end	 
    6'b101011:begin // sw
              RegWrite_o<=0;
				  ALU_op_o<=3'b000;  
				  ALUSrc_o<=1;
				  RegDst_o<=0;
				  Branch_o<=0;
				  Jump_o<=0;
              MemWrite_o<=1;
              MemRead_o<=0;
              MemtoReg_o<=0;

              end	 		

    6'b000010:begin // jump
              RegWrite_o<=0;
				  ALU_op_o<=3'b000;  
				  ALUSrc_o<=0;
				  RegDst_o<=0;
				  Branch_o<=0;
				  Jump_o<=1;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;

              end	

    6'b000111:begin // bgt(branch greater than)
              RegWrite_o<=0;
				  ALU_op_o<=6;  
				  ALUSrc_o<=0;
				  RegDst_o<=0;
				  Branch_o<=1;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
        		 end		  
	6'b000001:begin // bgez(branch greater equal zero) if(rs>=0)
              RegWrite_o<=0;
				  ALU_op_o<=7;  
				  ALUSrc_o<=0;
				  RegDst_o<=0;
				  Branch_o<=1;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;
				  
				  end
				  
	6'b100000:begin      //flush §âcontrol½uÂk¹s
              RegWrite_o<=0;
				  ALU_op_o<=0;  
				  ALUSrc_o<=0;
				  RegDst_o<=0;
				  Branch_o<=0;
				  Jump_o<=0;
              MemWrite_o<=0;
              MemRead_o<=0;
              MemtoReg_o<=0;


            	
        		 end		  			 

	
	  endcase
end


endmodule





                    
                    