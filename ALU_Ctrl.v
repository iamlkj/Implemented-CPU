//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [6-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [6-1:0] ALUCtrl_o;

//Parameter

       
//Select exact operation

always @(funct_i or  ALUOp_i) begin
	if(ALUOp_i==0) ALUCtrl_o<=2;
	else if(ALUOp_i==1) ALUCtrl_o<=6;
	else if(ALUOp_i==2&&funct_i[0]==0&&funct_i[1]==1&&funct_i[2]==0&&funct_i[3]==0&&funct_i[4]==0&&funct_i[5]==0)
	 ALUCtrl_o<=4; 
	else if(ALUOp_i==2&&funct_i[0]==0&&funct_i[1]==1&&funct_i[2]==1&&funct_i[3]==0&&funct_i[4]==0&&funct_i[5]==0)
	 ALUCtrl_o<=5; 
	else if(ALUOp_i==2&&funct_i[0]==0&&funct_i[1]==0&&funct_i[2]==0&&funct_i[3]==0)//ADD
	 ALUCtrl_o<=2;
   else if(ALUOp_i==2&&funct_i[0]==0&&funct_i[1]==1&&funct_i[2]==0&&funct_i[3]==0)//SUB
	 ALUCtrl_o<=6;	 
	else if(ALUOp_i==2&&funct_i[0]==0&&funct_i[1]==0&&funct_i[2]==1&&funct_i[3]==0)//AND
	 ALUCtrl_o<=0;
	else if(ALUOp_i==2&&funct_i[0]==1&&funct_i[1]==0&&funct_i[2]==1&&funct_i[3]==0)//OR
	 ALUCtrl_o<=1;
   else if(ALUOp_i==2&&funct_i[0]==0&&funct_i[1]==1&&funct_i[2]==0&&funct_i[3]==1)//slt
	 ALUCtrl_o<=7;
	else if(ALUOp_i==2&&funct_i==24)//mul
    ALUCtrl_o<=10;
	else if(ALUOp_i==3)
	 ALUCtrl_o<=3; 
	 else if(ALUOp_i==4)
	 ALUCtrl_o<=8; 
	  else if(ALUOp_i==5)
	 ALUCtrl_o<=9; 
	  else if(ALUOp_i==6) // bgez(branch greater than)
	 ALUCtrl_o<=11; 
	 else if(ALUOp_i==7) // bgt(branch greater equal zero) if(rs>=0)
	 ALUCtrl_o<=13;
	 
	
	else  ALUCtrl_o<=7;
end





endmodule     





                    
                    