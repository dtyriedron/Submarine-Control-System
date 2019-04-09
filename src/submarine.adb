with Ada.Text_IO;

package body Submarine with SPARK_Mode
is


   procedure decreaseDepth (dl : in out depthLevel; ox : in
                              oxygenLevelInt ; ds : DoorsArray) is
   begin
         dl := dl - 1;

   end decreaseDepth;

   procedure increaseDepth (dl : in out depthLevel; ox : in oxygenLevelInt ; ds : DoorsArray) is
   begin
      if dl<6 then
         dl := dl +1;
--           if (ox /= 0) then
--              decrementoxygen(oxylvl => ox);
--           end if;
--           if rt < 11 then
--              incrementHeat(relvl => rt);
--           end if;

      end if;

   end increaseDepth;

   procedure resurface (dl : in out depthLevel; ox : in out oxygenLevelInt ; ds : in DoorsArray ; rt : in reactorLevelInt) is
   begin
      while dl > 0 loop
         decreaseDepth(dl, ox, ds);
         end loop;
         ox :=8;
   end resurface;


         procedure run is
         begin
            while ((GreenSub.dl <6 and GreenSub.dl>=0) and (GreenSub.ox>=0 and GreenSub.ox <=8) and closeDoorsInvariant(GreenSub.ds) and GreenSub.rt>=0 and GreenSub.rt<=12) loop
         increaseDepth(GreenSub.dl, GreenSub.ox, GreenSub.ds);
         decrementoxygen(GreenSub.ox);


          if GreenSub.ox = 0 then
             --Ada.Text_IO.Put_Line("resurfacing");
                resurface(GreenSub.dl, GreenSub.ox, GreenSub.ds, GreenSub.rt);
            end if;
             if GreenSub.rt = 12 and (GreenSub.dl <6 and GreenSub.dl>0) and (GreenSub.ox>=0 and GreenSub.ox <=8) and closeDoorsInvariant(GreenSub.ds) then
                --Ada.Text_IO.Put_Line("resurfacing");
                resurface(GreenSub.dl, GreenSub.ox, GreenSub.ds, GreenSub.rt);
         elsif GreenSub.rt<12 then
            -- Ada.Text_IO.Put_Line("hey");
           incrementHeat(GreenSub.rt);
         end if;


            end loop;

     end run;
   end Submarine;
