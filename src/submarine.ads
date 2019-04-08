with doors; use doors;
with oxygenLevel; use oxygenLevel;

package Submarine with SPARK_Mode
is

   -- control of diving and surfacing
   type diveSurfaceWarnMaintain is (Dive, Surface, Warn, MaintainDepth);

   -- control of reactor temp
   type reacterTemp is (Hot, Cool);


   -- interger to prevent going below a depth
   type depthLevel is new Integer;

-- record for Submarine and contains 2 doors
   type Submarine is record
      ds : DoorsArray;
      ox : oxygenLevelInt := 6;
      dl : depthLevel := 6;
      rt : reacterTemp;
   end record;

   -- invarient to make sure that all doors are closed beofre doing any command in the submarine
   function closeDoorInvariant (ds : DoorsArray) return Boolean is
     (for some J in ds'Range => ds(J).doorStatus = Closed and then ds(J).alock.lockStatus = Locked);

   function closeDoorsInvariant (ds : DoorsArray) return Boolean is
      (for all J in ds'Range => ds(J).doorStatus = Closed and then ds(J).alock.lockStatus = Locked);

   procedure decreaseDepth (dl : in out depthLevel; ox : in oxygenLevelInt ; ds : in DoorsArray) with
     Pre => ox =0 and dl > depthLevel'First and closeDoorsInvariant(ds),
     Post => dl = dl'Old - 1;

   procedure increaseDepth (dl : in out depthLevel; ox : in oxygenLevelInt ; ds : in DoorsArray) with
     Pre => ox=0 and dl < 6 and closeDoorsInvariant(ds),
     Post => dl = dl'Old +1;


end Submarine;
