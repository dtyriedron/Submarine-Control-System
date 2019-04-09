with Submarine; use Submarine;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
     Put_Line("depth is: ");
   Put_Line(GreenSub.dl'Image & " oxygen: " & GreenSub.ox'Image & " heat: " & GreenSub.rt'Image);
     run;
     Put_Line(GreenSub.dl'Image & " oxygen: " & GreenSub.ox'Image & " heat: " & GreenSub.rt'Image);

   null;
end Main;
