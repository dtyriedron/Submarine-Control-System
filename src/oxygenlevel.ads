with doors; use doors;


package oxygenLevel is
  
   
   -- integer to store the oxygen level max is 8
   type oxygenLevelInt is new Integer;
   
   procedure decrementoxygen (oxylvl : in out oxygenLevelInt) with
     Depends => (oxylvl => oxylvl),
     Pre => oxylvl <= 8,
     Post => oxylvl = oxylvl'Old -1 and oxylvl>=0;
   

end oxygenLevel;
