with Ada.Text_IO;
package body oxygenLevel is

   procedure decrementoxygen (oxylvl : in out oxygenLevelInt) is
   begin
      if oxylvl > 0 then
         oxylvl := oxylvl -1;
      elsif oxylvl <= 3 then
         Ada.Text_IO.Put_Line("warning");
         
      end if;
      
   end decrementoxygen;
         

end oxygenLevel;
