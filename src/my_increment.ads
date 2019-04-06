package My_Increment
  with SPARK_Mode
is

   type Modulo is range 1..10;

   function Bad_Incr (m : Modulo) return Modulo
   with
     Post => Bad_Incr'Result > m;

end My_Increment;
