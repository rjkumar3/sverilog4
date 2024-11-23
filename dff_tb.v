`timescale 1ns / 1ns
module dff_tb();

	reg clock;
	reg clear;
	reg data;
	wire q, qbar;

	dff UUT(q, qbar, clock, data, clear);

	initial begin
		$vcdpluson;
		clock = 0;
		clear = 0;
		data = 0;

		forever #20 clock = ~clock;
	end

// Testbench Behavior

	// Simulate test scenario
	initial begin
		#20 clear = 0;

		// Apply data to D input
		#50 data = 1;
		#50 data = 0;
		#50 data = 1;

		#50 clear = 1;

		#50 data = 1;
		#50 data = 0;
		#50 data = 1;

		//Finish simulation after some time
		#100 $finish;
	end

	always @(posedge clock or posedge clear) begin
		if (clear) begin

		//Use $monitor to display clear information
		$monitor("CLear asserted at time %t", $time);
		end else begin

		//Use $display to display D flip-flop input and output values
		$display("Input d = %b, output q = %b, output qbar = %b at time %t", data, q, qbar, $time);

		//Use $write to write input and output values to a file
		$write("d=%b q=%b qbar=%b\n", data, q, qbar);

		//Use $strobe to create a strobe signal for debugging
		$strobe(10, "strobe at time %t", $time);
		end
	end
endmodule
