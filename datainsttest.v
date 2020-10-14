module instDatatest;

	// Inputs
	reg [31:0] inst;
	reg clk;

	// Outputs
	wire [1:0] instype;
	wire [2:0] datainstype; 

	// Instantiate the Unit Under Test (UUT)
	datamodule uut (
		.inst(inst), 
		.instype(instype), 
		.datainstype(datainstype)
	);
	
	initial begin
		// Initialize Inputs
		inst = 0;
		#10;
		inst=567489;
		#10;
		inst=457545655;
		#10;
		inst=54596520;
		
	end
      
endmodule