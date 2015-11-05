//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [6-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
assign   zero_o=((result_o==0&&ctrl_i==6)||
					  (result_o!=0&&ctrl_i==9)||
					  (result_o==1&&ctrl_i==11)||
					  (result_o==1&&ctrl_i==13)
					  );
wire[1:0] ha;
assign ha[1]=src1_i[31];
assign ha[0]=src2_i[31];
//Parameter

//Main function
always @(src1_i or src2_i or ctrl_i) begin

  case(ctrl_i)
        0:begin result_o<=src1_i&src2_i;end
		  1:begin result_o<=src1_i|src2_i;end
        2:begin result_o<=src1_i+src2_i;end
		  3:begin result_o<=src2_i*(65536);end
        4:begin result_o<=(src1_i<<src2_i);end
		  5:begin result_o<=(src1_i>>src2_i);end
        6:begin result_o<=src1_i-src2_i;end
        7:begin result_o<=((src1_i[31]>=src2_i[31])&&(src1_i[30:0]<src2_i[30:0]))?1:0;end
		  8:begin result_o<=src1_i|src2_i; end
		  9:begin result_o<=src1_i;end
		  10:begin result_o<=src1_i*src2_i;end
		  11:
			begin 
				case(ha)
				0:result_o<=(src1_i[30:0]>src2_i[30:0])?1:0;
				1:result_o<=1;
				2:result_o<=0;
				3:result_o<=(src1_i[30:0]>src2_i[30:0])?1:0;
				endcase
			end//bgt(branch greater than)
        12:begin result_o<=~(src1_i|src2_i);end
		  13:begin result_o<= (src1_i[31]==0)?1:0;end//bgez(branch greater equal zero) if(rs>=0)
        default:begin result_o<=0;end		  
     endcase
	 

end
endmodule





                    
                    