`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:51 10/13/2020 
// Design Name: 
// Module Name:    datamodule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module datamodule(
input [31:0] inst,
output reg[1:0] instype,
output reg [2:0] datainstype
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
					
	 1: instype=2;
	 2: instype=3;
	 3: instype=0;
	 endcase
	 end
	 endmodule
	
