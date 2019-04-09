with doors; use doors;
with oxygenLevel; use oxygenLevel;
with reactor; use reactor;

package Submarine with SPARK_Mode
is

--     -- control of diving and surfacing
--     type diveSurfaceWarnMaintain is (Dive, Surface, Warn, MaintainDepth);




   -- interger to prevent going below a depth
   type depthLevel is new Integer;

-- record for Submarine and contains 2 doors
   type SubmarineType is record
      ds : DoorsArray;
      -- oxygen decreases over time until 0 and then procedure resurface will be invoked.
      ox : oxygenLevelInt := 8;
      -- depth increases when the submarine is rdy to until it reaches max depth (6),
      -- however the resurface procedure may be invoked to decrease the depth again.
      dl : depthLevel := 0;
      -- the temp of the reactor increase over time when it reaches max temp (6),
      -- the resurface procedure will be invoked.
      rt : reactorLevelInt := 0;
   end record;

   -- invarient to make sure one door is closed at all times
   function closeDoorInvariant (ds : DoorsArray) return Boolean is
     (for some J in ds'Range => ds(J).doorStatus = Closed and then ds(J).alock.lockStatus = Locked);

   -- invarient to make sure both doors are closed before any action is taken
   function closeDoorsInvariant (ds : DoorsArray) return Boolean is
      (for all J in ds'Range => ds(J).doorStatus = Closed and then ds(J).alock.lockStatus = Locked);

   procedure decreaseDepth (dl : in out depthLevel; ox : in oxygenLevelInt ; ds : in DoorsArray) with
     Pre => ox >= 0 and dl > depthLevel'First and closeDoorsInvariant(ds),
     Post => dl = dl'Old - 1;

   procedure resurface (dl : in out depthLevel; ox : in out oxygenLevelInt ; ds : in DoorsArray ; rt : in reactorLevelInt) with
     Pre => ((ox = 0) or (rt = 12 and ox > 0)) and dl > 0 and dl > depthLevel'First and closeDoorsInvariant(ds),
     Post => dl = 0;

   procedure increaseDepth (dl : in out depthLevel; ox : in out oxygenLevelInt ; ds : in DoorsArray ; rt : in out reactorLevelInt) with
     Pre => ox >= 0 and ox <= 8 and dl >= 0 and dl < 6 and closeDoorsInvariant(ds),
     Post => dl = dl'Old +1 and dl <=6;

   doorArray : DoorsArray := (others => (doorStatus => Closed, alock => (lockStatus => Locked)));

   GreenSub : SubmarineType := (ds => doorArray, ox => 8, dl => 0, rt => 0);


--     procedure run (sub : in out SubmarineType);
--  --       Pre => sub.dl<6
   end Submarine;
