package body Submarine with SPARK_Mode
is


   procedure decreaseDepth (dl : in out depthLevel; ox : in
                              oxygenLevelInt ; ds : DoorsArray) is
   begin
         dl := dl - 1;

   end decreaseDepth;

   procedure increaseDepth (dl : in out depthLevel; ox : in oxygenLevelInt ; ds : DoorsArray) is
   begin
      dl := dl +1;
   end increaseDepth;



end Submarine;






