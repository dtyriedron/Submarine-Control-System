with Ada.Text_IO;

package body Submarine with SPARK_Mode
is


   procedure decreaseDepth (dl : in out depthLevel; ox : in
                              oxygenLevelInt ; ds : DoorsArray) is
   begin
         dl := dl - 1;

   end decreaseDepth;

   procedure increaseDepth (dl : in out depthLevel; ox : in out oxygenLevelInt ; ds : DoorsArray ; rt : in out reactorLevelInt) is
   begin
      if dl<6 then
         dl := dl +1;
         if (ox /= 0) then
            decrementoxygen(oxylvl => ox);
         end if;
         if rt < 11 then
            incrementHeat(relvl => rt);
         end if;

      end if;

   end increaseDepth;

   procedure resurface (dl : in out depthLevel; ox : in out oxygenLevelInt ; ds : in DoorsArray ; rt : in reactorLevelInt) is
   begin
      while dl > 0 loop
         decreaseDepth(dl, ox, ds);
         end loop;
         ox :=8;
   end resurface;


--         procedure run (sub : in out SubmarineType)is
--         begin
--            while ((sub.dl <6 and sub.dl>=0) and (sub.ox>=0 and sub.ox <=8) and closeDoorsInvariant(sub.ds)) loop
--               increaseDepth(sub.dl, sub.ox, sub.ds, sub.rt);
--           if sub.ox = 0 then
--              --Ada.Text_IO.Put_Line("resurfacing");
--                resurface(sub.dl, sub.ox, sub.ds, sub.rt);
--             end if;
--             if sub.rt = 12 then
--                --Ada.Text_IO.Put_Line("resurfacing");
--                resurface(sub.dl, sub.ox, sub.ds, sub.rt);
--             end if;
--
--            end loop;
--
--     end run;
   end Submarine;
