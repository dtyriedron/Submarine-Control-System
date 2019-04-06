package Submarine with SPARK_Mode
is
-- doors can be closed or open
   type doorClosedOpen is (Closed, Open);

-- doors have an ID
   type doorID is (1, 2);

-- record for Door that contains a doorStatus and an ID
   type Door is record
      doorStatus : doorClosedOpen;
      doorID : doorID;
   end record;

-- record for Submarine and contains 2 doors
   type Submarine is record
      door1 : Door;
      door2 : Door;
   end record;

-- Variables for doors
   D1 : Door := (doorStatus => Open, doorID => 1);
   D2 : Door := (doorStatus => Closed, doorID => 2);

-- Variable for Submarine
   S1 : Submarine := (door1 => D1, door2 => D2);





end Submarine;
