module warning_system_tb_v2;

  //regs for inputs
  reg sb, door, key, brk, park, hood, bat_ok, aib_ok, tmp_ok, pass_occ, sb_p, trunk, pbrk, srv;
  //wires for outputs
  wire start_permit, chime, warn_pri2, warn_pri1, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, airbag_warn, temp_warn;


  wire [0:13] i;
  assign i = {sb, door, key, brk, park, hood, bat_ok, aib_ok, tmp_ok, pass_occ, sb_p, trunk, pbrk, srv};
  
  wire [0:10] o;
  assign o = {warn_pri2, start_permit, chime, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, airbag_warn, temp_warn, warn_pri1};
  //instantiate module to test
  warning_system uut(sb, door, key, brk, park, hood, bat_ok, aib_ok, tmp_ok, pass_occ, sb_p, trunk, pbrk, srv, start_permit, chime, warn_pri2, warn_pri1, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, airbag_warn, temp_warn);

  //test cases
  initial begin
    
    //oh no i forgot my key (car shouldn't start)
    key = 0; brk = 1; park = 1; bat_ok = 1; aib_ok = 1; tmp_ok = 1;
    //all the other defaults; i have a passenger and everything is closed
    sb = 1; door = 1; hood = 1; pass_occ = 1; sb_p = 1; trunk = 1; pbrk = 1; srv = 0;
    #10;
    
    //everything is fine and I wanna start my car (car should start)
    key = 1;
    #10;
    
    //whaaat my battery is going to combust??? (the car shouldn't start and bat_warn is on)
    bat_ok = 0;
    #10;
    bat_ok = 1;
    #10;
    
    //haha nevermind. but my airbags are going to explode :'( (car shouldn't start and airbag_warn is on)
    aib_ok = 0;
    #10;
    aib_ok = 1;
    #10;
    
    //of course the coolant temp is bad after the airbags fixed themselves (car shouldn't start and temp_warn is on)
    tmp_ok = 0;
    #10;
    
    //okay, let me take it to the shop to get maitenenced (car should start and temp_warn is on)
    srv = 1; pass_occ = 0; sb_p = 0;
    #10;
    tmp_ok = 1; srv = 0;//(they fixed it)
    #10;
    
    //ready to drive! but I forgot to buckle my seatbelt (seat_warn, p2 warning/chime)
    sb = 0;
    #10;
    sb = 1; //(seat_warn and p2/chime off)
    #10;
    
    //okay now its my passenger's fault (seat_warn, p2/chime on)
    pass_occ = 1; sb_p = 0;
    #10;
    sb_p = 1; //(seat_warn, p2/chime off)
    #10;
    
    //man i left my door open. (door_warn, p2/chime)
    door = 0;
    #10;
    door = 1;
    #10
    
    $stop;
  
  end
endmodule