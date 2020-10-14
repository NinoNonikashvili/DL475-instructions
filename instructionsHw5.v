module datamodule(
input [31:0] inst,
output reg[1:0] instype,
output reg [2:0] datainstype,
output reg [1:0] meminstype,
output reg [1:0] branchinstype
 
    );
	  
	 reg [1:0] bits;	
	 
	
	 always @(inst) 
begin
bits[0]=inst[26];
bits[1]=inst[27];
	 case(bits)
	 0: begin instype=1;
				if(inst[25]==1)
				datainstype=1;
				else if(inst[4]==0&&inst[25]==0)
				datainstype=2;
				else if(inst[7]==0&&inst[4]==1&&inst[25]==0)
				datainstype=3;
				else if(inst[24]==0&&inst[6]==0&&inst[5]==0&&inst[7]==1&&inst[4]==1&&inst[25]==0)
				datainstype=4;
				else
				datainstype=0;
				
		end	
					
	 1: begin instype=2;
				if(inst[25]==1)
				meminstype=1;
				else if(inst[4]==1&&inst[25]==0)
				meminstype=2;
				else
				meminstype=0;
				
		end
			
	 2: begin instype=3;
				if(inst[25]==1&&inst[24]==0)
				branchinstype=1;  //branch
				else if(inst[25]==1&&inst[24]==1)
				branchinstype=2;  //branch and link
				else
				branchinstype=0;
				
		end
	 3: instype=0;
	 endcase
	 end
	 endmodule