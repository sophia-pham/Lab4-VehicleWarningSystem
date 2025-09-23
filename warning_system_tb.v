module warning_system_tb();

	//regs for inputs
	//SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV
	reg [13:0] i;
	//wires for outputs
	wire START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN;
	
	//instantiate module to test
	warning_system uut(.i[0](i[0]), //SB
					.i[1](i[1]), //DOOR
					.i[2](i[2]), //KEY
					.i[3](i[3]), //BRK
					.i[4](i[4]), //PARK
					.i[5](i[5]), //HOOD
					.i[6](i[6]), //BAT_OK
					.i[7](i[7]), //AIB_OK
					.i[8](i[8]), //TMP_OK
					.i[9](i[9]), //PASS_OCC
					.i[10](i[10]), //SB_P
					.i[11](i[11]), //TRUNK
					.i[12](i[12]), //PBRK
					.i[13](i[13]), //SRV
					.o[1](START_PERMIT),
					.o[2](CHIME),
					.o[0](WARN_PRI2),
					.o[10](WARN_PRI1),
					.o[3](SEAT_WARN),
					.o[4](DOOR_WARN),
					.o[5](HOOD_WARN),
					.o[6](TRUNK_WARN),
					.o[7](BAT_WARN),
					.o[8](AIRBAG_WARN),
					.o[9](TEMP_WARN));
	
	//test cases
	initial begin
		i = 14'b1;
		//car can start normally
		i[2]=1; i[3]=1; i[4]=1; i[6]=1; i[7]=1; i[8]=1;
		#10;
		
		//car cannot start because no key
		i[2] = 0;
		#10;
		
		i = 14'b1;
		//car can start to be serviced
		i[2]=1; i[3]=1; i[4]=1; i[6]=0; i[7]=0; i[8]=0; i[13]=1;
		#10;
		
		i = 14'b1;
		//driver seatbelt unbuckled
		i[0] = 0;
		#10;
		
		i = 14'b1;
		//passenger is present and seatbelt unbuckled
		i[9] = 1; i[10] = 0;
		#10;
		
		i = 14'b1;
		//door is open
		i[1]=0;
		#10;
		
		i = 14'b1;
		//hood is open
		i[5]=0;
		#10;
		
		i = 14'b1;
		//trunk is open
		i[11]=0;
		#10;
		
		i = 14'b1;
		//battery not okay
		i[6]=0;
		#10;
		
		i = 14'b1;
		//airbag not okay
		i[7]=0;
		#10;
		
		i = 14'b1;
		//coolant temp not okay
		i[8]=0;
		#10;
		
		i = 14'b1;
		//parking brake on
		i[12]=1;
		




	end
endmodule