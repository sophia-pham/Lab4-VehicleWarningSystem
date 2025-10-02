# Lab4-VehicleWarningSystem
A combinational system to activate warning symbols depending on a vehicle's current condition.

The system considers 14 inputs:
- SB: driver's seatbelt; 1 = fastened
- DOOR: status of doors; 1 = closed
- KEY: key inserted? 1 = yes
- BRK: brake pressed? 1 = yes
- PARK: car in park? 1 = yes
- HOOD: status of hood; 1 = closed
- BAT_OK: battery status; 1 = OK
- AIB_OK: airbag status; 1 = OK
- TMP_OK: coolant temp. status; 1 = OK
- PASS_OCC: passenger seat occupied? 1 = yes
- SB_P: passenger's seatbelt; 1 = fastened
- TRUNK: status of trunk; 1 = closed
- PBRK: parking brake engaged? 1 = yes
- SRV: car service mode is on? 1 = yes --> allows the car to turn on to be serviced

...and 11 outputs:
- WARN_PRI2: warning that causes harm but not immediate damage to the car or users; 1 = active
- START_PERMIT: is the car permitted to start? 1 = yes
- CHIME: chime sound that activates with priority 2 warnings; 1 = chime active
- SEAT_WARN: seatbelt warning if driver or passenger is not wearing seatbelt; 1 = active
- DOOR_WARN: warning if door is open; 1 = active
- HOOD_WARN: warning if hood is open; 1 = active
- TRUNK_WARN: warning if trunk is open; 1 = active
- BAT_WARN: warning if battery is not okay to drive; 1 = active
- AIRBAG_WARN: warning if airbag is not okay to drive; 1 = active
- TEMP_WARN: warning if coolant temp is not okay to drive; 1 = active
- WARN_PRI1: warning that is immediately dangerous if car is driven (e.g. battery); 1 = active

The system combines these inputs to form the warnings as outputs, simulating a real car's safety system. The truth table can be found here: https://docs.google.com/spreadsheets/d/1EYByy2_hlIpdLswQX0r4yFCDDF4Oxshse0KurZRFACE/edit?usp=sharing
