package body Submarine with SPARK_Mode
is



   procedure checkDoors(ds : in out Doors) is
      a : DR_Index := ds'First;
      b : DR_Index := ds'Last;
   begin
      for I in a..b loop
         ds(I).doorStatus := Closed;
         end loop;
   end checkDoors;




end Submarine;
