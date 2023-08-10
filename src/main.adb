with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with fib;                 use fib;
with lotto; use lotto;


procedure Main is
 tmpStr : String :="";
 myStr :String :="";
begin
   Put_Line ("Hello World! ");
   fibonacci;
   Lottery;
   Put_Line(myStr);


end Main;
