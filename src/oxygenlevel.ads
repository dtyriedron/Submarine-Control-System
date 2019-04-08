with doors; use doors;


package oxygenLevel is
  
   
   -- integer to store the oxygen level max is 6
   type oxygenLevelInt is new Integer;
   
   procedure decrementoxygen (oxylvl : in out oxygenLevelInt) with
     Depends => (oxylvl => oxylvl),
     Pre => oxylvl < 6,
     Post => oxylvl = oxylvl'Old -1 and oxylvl>=0;
   
--     procedure warnOxygen (oxylvl : in out oxygenLevelInt) with
--       Depends => (oxylvl => oxylvl),
--       Pre => oxylvl < 6,
--       Post => oxylvl < 3;
   

end oxygenLevel;
