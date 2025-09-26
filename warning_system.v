`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 02:44:54 PM
// Design Name: 
// Module Name: warning_system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module warning_system(
    input [13:0] i,
    output [10:0] o
    );

 wire W1, W2, W3, W4;

assign W1 = (i[2] & i[3] & i[4]) & (i[6] & i[7] & i[8]); //key-brk-park and bat-aib-tmp
assign W2 = (i[2] & i[3] & i[4]) & ~(i[6] & i[7] & i[8]) & (i[13]); //key-brk-park and NOT bat-aib-tmp

assign o[1] = W1 | W2; //start permit

assign W3 = ~i[0];
assign W4 = i[9] & ~i[10];
assign o[3] = W3 | W4; //seat warning

assign o[4] = ~i[1]; //door warning
assign o[5] = ~i[5]; //hood warning
assign o[6] = ~i[11]; //trunk
assign o[7] = ~i[6]; //bat
assign o[8] = ~i[7]; //airbag
assign o[9] = ~i[8]; //temp

assign o[2] = o[3] | o[4] | o[6] | i[12]; //chime
assign o[0] = o[2]; //priority 2
assign o[10] = o[5] | o[9] | o[7] | o[8]; //priority 1

endmodule
