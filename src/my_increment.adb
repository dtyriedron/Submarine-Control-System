package body My_Increment
  with SPARK_Mode
is
   function Bad_Incr (m : Modulo) return Modulo
   is begin
      if m < Modulo'Last then return m+1;
      else return m;
         end if;
   end Bad_Incr;

end My_Increment;
