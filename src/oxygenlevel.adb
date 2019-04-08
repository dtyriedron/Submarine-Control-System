package body oxygenLevel is

   procedure decrementoxygen (oxylvl : in out oxygenLevel) is
   begin
      if oxylvl > 1 then
         oxylvl := oxylvl -1;
      else 
         oxylvl := oxylvl;
      end if;
      
   end decrementoxygen;
   
   

end oxygenLevel;
