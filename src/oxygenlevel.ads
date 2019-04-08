with doors use doors;

package oxygenLevel is

   
   -- integer to store the oxygen level max is 6
   type oxygenLevel is new Integer;
   
   procedure decrementoxygen (oxylvl : in out oxygenLevel) with
     Depends => (oxylvl => oxylvl),
     Pre => oxylvl > oxygenLevel'Last,
     Post => oxylvl = oxylvl'Old -1 and oxylvl>=1;
   
   procedure resurface (oxylvl : in out oxgenLevel) with
     Depends => (oxylvl => oxylvl),
     Pre => 
     

end oxygenLevel;
