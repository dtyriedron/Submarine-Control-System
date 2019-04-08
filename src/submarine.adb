package body Submarine with SPARK_Mode
is





   procedure diveSub (sub : in out Submarine) is
   begin
--        sub.rt := Cool;
--  --       change depth level until it reaches 3
--          while sub.dl > 3 and sub.ox > 3 and sub.rt /= Hot loop
--             sub.dl := sub.dl - 1;
--             sub.ox := sub.ox - 1;
--          end loop;



   end diveSub;

   procedure resurfaceSub (sub : in out Submarine) is
   begin
      sub.subDive := Surface;
   end resurfaceSub;

   procedure warnSub (sub : in out Submarine) is
   begin
      sub.subDive := Warn;
   end warnSub;







end Submarine;






