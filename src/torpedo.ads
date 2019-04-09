package torpedo is

   -- torpedoes can be fired, stored and loaded
   type torpedoStatus is (Fired, Stored, Loaded);
   
   -- hatches can be opened or closed
   type hatchStatus is (Open, Closed);
   
   -- record for torpedo that contains a torpedoStatus
   type torpedoType is record
      tst : torpedoStatus;
   end record;
   
   -- record for torpedo that contains a torpedoStatus
   type hatch is record
      hst : hatchStatus;
   end record;
   
   -- array index
   type TOR_Index is range 1..2;
   
   -- array index for hatches
   type HAT_index is range 1..2;
   
   -- array of hatches
   type hatches is array (HAT_Index) of hatch;
   
   -- array of torpedoes
   type torpedoes is array (TOR_Index) of torpedoType;
   
   -- each torpedoChamber has hatches and a torpedo
   type torpedoChamber is record
      t : torpedoType;
      hs : hatches;
   end record;
   
   -- invarient to make sure both hatches are closed before torpedo is fired
   function closeHatches (hs : hatches) return Boolean is
     (for all J in hs'Range => hs(J).hst = Closed);
   
   -- fire torpedo safely requires airlock
   procedure fireTorpedo (tc : in out torpedoChamber) with
     Pre => closeHatches(tc.hs),
     Post => tc.hs(2).hst = Closed and tc.t.tst = Fired;
   
   procedure storeTorpedo (tc : in out torpedoChamber) with
     Pre => tc.hs(2).hst = Open and tc.hs(1).hst = Closed,
     Post => tc.hs(1).hst = Open and tc.hs(2).hst = Closed and tc.t.tst = Stored; 
   
   procedure loadTorpedo (tc : in out torpedoChamber) with
     Pre => tc.hs(2).hst = Closed and tc.hs(1).hst = Open,
     Post => closeHatches(tc.hs) and tc.t.tst = Loaded;
   

end torpedo;
