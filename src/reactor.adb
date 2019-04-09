package body reactor is

   procedure incrementHeat (relvl : in out reactorLevelInt) is
   begin
      if relvl < 11 then
         relvl := relvl +1; 
      end if;
      
   end incrementHeat;

end reactor;
