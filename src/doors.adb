package body doors is

   procedure closeDoors(ds : in out DoorsArray) is
      a : DR_Index := ds'First;
      b : DR_Index := ds'Last;
   begin
      for I in a..b loop
         ds(I).doorStatus := Closed;
         ds(I).alock.lockStatus := Locked;
      end loop;
   end closeDoors;

end doors;
