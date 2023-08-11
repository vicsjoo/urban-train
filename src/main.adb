with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with fib;                 use fib;
with lotto;               use lotto;

procedure Main is

begin
   --  Put_Line ("Hello World! ");
   for index in 1..10 loop
    Lottery;
end loop;
   Lottery;
   --  fibonacci;
   --  Put_Line(myStr);

end Main;
