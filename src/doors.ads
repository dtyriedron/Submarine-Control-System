package doors is

   -- doors can be closed or open
   type doorClosedOpen is (Closed, Open);
   
   -- locks can be locked or unlocked
   type lockLockedUnlocked is (Locked, Unlocked);
   
   -- record for lock that contains a lockStatus
   type Lock is record
      lockStatus : lockLockedUnlocked;
   end record;
   
   -- record for Door that contains a doorStatus which depends on the lock status
   type Door is record
      doorStatus : doorClosedOpen;
      alock : Lock;
   end record;
   
   -- array index
   type DR_Index is range 1..2;
   
   -- array of doors
   type DoorsArray is array (DR_Index) of Door;
   
   -- procedure to lock and close the doors
   procedure closeDoors (ds : in out DoorsArray) with
     Post => (for all J in ds'Range => ds(J).doorStatus = Closed and then ds(J).alock.lockStatus = Locked);

   

end doors;
