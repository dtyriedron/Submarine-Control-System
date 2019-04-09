package reactor is

   -- control of reactor temp
   -- type reacterTemp is (Hot, Cool);
   
   -- integer to store the reactor level max is 6
   type reactorLevelInt is new Integer;
   
   procedure incrementHeat (relvl : in out reactorLevelInt) with
     Depends => (relvl => relvl),
     Pre => relvl < 12,
     Post => relvl = relvl'Old +1 and relvl=12;
   

end reactor;
