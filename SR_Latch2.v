`timescale 1 ns / 100 ps

`define PRIMARY_OUT	2
`define FAN_OUT_1	0.5
`define FAN_OUT_2	0.8
`define FAN_OUT_3	1
`define TIME_DELAY_1	3
`define TIME_DELAY_2	4
`define TIME_DELAY_3	5

module SR_Latch2(Q, Qnot, s0, s1, r0, r1);
	input s0, s1, r0, r1;
	output Q, Qnot;

	nand #(`TIME_DELAY_3 + `FAN_OUT_2) NAND1(Q, s0, s1, Qnot);
	nand #(`TIME_DELAY_3 + `FAN_OUT_2) NAND2(Qnot, r0, r1, Q);

endmodule

