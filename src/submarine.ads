with doors use doors;
with oxygenLevel use oxygenLevel;

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
      ds : Doors;
      ox : oxygenLevel := 6;
      dl : depthLevel := 6;
      subDive : diveSurfaceWarnMaintain;
      rt : reacterTemp;
   end record;


   -- procedure to dive the submarine if the doors are closed doors
   procedure diveSub (sub : in out Submarine) with
     Pre => (closeDoorsInvariant (sub.ds));
--       Post => ((sub.dl >= 3) and (sub.ox >= 3) and (sub.rt /= Hot) and closeDoorsInvariant(sub.ds));

   -- procedure to resurface if oxygen too low
   procedure resurfaceSub (sub : in out Submarine) with
     Pre => (sub.dl<6) and (sub.ox = 0 or sub.rt = Hot);

   -- procedure to warn sub of low oxygen
   procedure warnSub (sub : in out Submarine) with
     Pre => (sub.ox < 4);




end Submarine;
