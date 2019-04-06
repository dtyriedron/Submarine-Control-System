package Submarine with SPARK_Mode
is
-- doors can be closed or open
   type doorClosedOpen is (Closed, Open);

   -- record for Door that contains a doorStatus and an ID
   type Door is record
      doorStatus : doorClosedOpen;
   end record;

   -- array index
   type DR_Index is range 1..2;

   --array of doors
   type Doors is array (DR_Index) of Door;

-- record for Submarine and contains 2 doors
   type Submarine is record
      ds : Doors;
   end record;

   procedure checkDoors (ds : in out Doors) with
     Post => (for all J in ds'Range => ds(J).doorStatus = Closed);

end Submarine;
