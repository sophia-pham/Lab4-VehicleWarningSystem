module warning_system_tb_v2;

  //regs for inputs
  //reg sb 0, door 1, key 2, brk 3, park 4, hood 5, bat_ok 6, aib_ok 7, tmp_ok 8, pass_occ 9, sb_p 10, trunk 11, pbrk 12, srv 13;
  //wires for outputs
  //wire start_permit, chime, warn_pri2, warn_pri1, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, airbag_warn, temp_warn;


  wire [13:0] i;
  //assign i = {sb, door, key, brk, park, hood, bat_ok, aib_ok, tmp_ok, pass_occ, sb_p, trunk, pbrk, srv};
  
  wire [10:0] o;
  //assign o = {warn_pri2, start_permit, chime, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, airbag_warn, temp_warn, warn_pri1}
  //assign {warn_pri2, start_permit, chime, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, airbag_warn, temp_warn, warn_pri1}=o;
  //instantiate module to test
  warning_system uut(i, o);

  //test cases
  initial begin
    
    //oh no i forgot my key (car shouldn't start)
    i[2] = 0; i[3] = 1; i[4] = 1; i[6] = 1; i[7] = 1; i[8] = 1;
    //all the other defaults; i have a passenger and everything is closed
    i[0] = 1; i[1]= 1; i[5] = 1; i[9] = 1; i[10]= 1; i[11] = 1; i[12] = 1; i[13] = 0;
    #10;
    
    //everything is fine and I wanna start my car (car should start)
    i[2] = 1;
    #10;
    
    //whaaat my battery is going to combust??? (the car shouldn't start and bat_warn is on)
    i[6] = 0;
    #10;
    i[6] = 1;
    #10;
    
    //haha nevermind. but my airbags are going to explode :'( (car shouldn't start and airbag_warn is on)
    i[7] = 0;
    #10;
    i[7] = 1;
    #10;
    
    //of course the coolant temp is bad after the airbags fixed themselves (car shouldn't start and temp_warn is on)
    i[8] = 0;
    #10;
    
    //okay, let me take it to the shop to get maitenenced (car should start and temp_warn&pri1 are on)
    i[13] = 1; i[9] = 0; i[10] = 0; i[5] = 0;
    #10;
    i[8] = 1; i[13] = 0; i[5] = 1;//(they fixed it)
    #10;
    
    //ready to drive! but I forgot to buckle my seatbelt (seat_warn, p2 warning/chime)
    i[0] = 0;
    #10;
    i[0] = 1; //(seat_warn and p2/chime off)
    #10;
    
    //okay now its my passenger's fault (seat_warn, p2/chime on)
    i[9] = 1; i[10] = 0;
    #10;
    i[10] = 1; //(seat_warn, p2/chime off)
    #10;
    
    //man i left my door open. (door_warn, p2/chime)
    i[1] = 0;
    #10;
    i[1] = 1;
    #10
    
    $stop;
  
  end
endmodule