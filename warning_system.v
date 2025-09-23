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
    
wire W1, W2, W3, W4, W5;
wire notSB, notPassSB, passNeedsSB;

//airbag warning
not (o[8], i[7]);

//temp warning
not (o[9], i[8]);

//bat warning
not O7(o[7], i[6]);

//trunk warning
not O6(o[6], i[11]);

//hood warning
not O5(o[5], i[5]);

//door warning
not O4(o[4], i[1]);

//seat warning
//or O3(o[3], i[7], i[9], i[0]);
//assign o[3] = ~i[0] | (i[9] & ~i[10]);
not (notSB, i[0]);
not (notPassSB, i[10]);
and (passNeedsSB, notPassSB, i[9]);
and (o[3], notSB, passNeedsSB);

//key-brake-park
and A1(W1,i[2], i[3], i[4]);

//bat-aib-pass
and A2(W2, i[6], i[7], i[8]);

//not bat-aib-pass
not N1(W4, W2);

//not bat-aib-pass, key-brake-park, service to output to start
and A3(W3, W4, W1, i[13]);


and O11(W5, W1, W2);  

or (o[1], W5, W3); //output to start

//chime
or O2(o[2], o[3], o[4], o[6], i[12]);

//priority 2
or O12(o[0], o[3], o[4], o[6], i[12]);

//priority 1
or O13(o[10], o[5], o[7], o[8], o[9]);

    
endmodule
