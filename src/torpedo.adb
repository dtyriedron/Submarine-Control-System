with Ada.Text_IO;
package body torpedo is

   procedure fireTorpedo(tc : in out torpedoChamber) is
   begin
      -- open last hatch
      tc.hs(2).hst := Open;
      
      -- fire torpedo
      tc.t.tst := Fired;
   end fireTorpedo;
   
   procedure storeTorpedo(tc : in out torpedoChamber) is
   begin
      -- close last hatch
      tc.hs(2).hst := Closed;
      
      -- open first hatch
      tc.hs(1).hst := Open;
      
      -- store torpedo
      tc.t.tst := Stored;
   end storeTorpedo;
   
   procedure loadTorpedo (tc : in out torpedoChamber) is
   begin
      -- load the torpedo
      tc.t.tst := Loaded;
      -- close hatches
      tc.hs(1).hst := Closed;
      tc.hs(2).hst := Closed;
   end loadTorpedo;
     
   

end torpedo;
