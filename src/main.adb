with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Ada.Strings;
with Ada.Strings.Unbounded;
with fib;
procedure Main is

begin
   Put_Line ("Hello World! ");
   fib.fibonacci;
end Main;

--  ADA 2022 big int version
--  with Ada.Numerics.Big_Numbers; use Ada.Numerics.Big_Numbers;
--  procedure lFibonacci is
--     Max : constant                                     := 1_000;
--     Fib : array (0 .. Max) of Big_Integers.Big_Integer := (others => 0);
--
--     procedure Calculate_Fibonacci is
--     begin
--        Fib (0) := 0;
--        Fib (1) := 1;
--
--        for I in 2 .. Max loop
--           Fib (I) := Fib (I - 1) + Fib (I - 2);
--        end loop;
--     end Calculate_Fibonacci;
--
--  begin
--     Calculate_Fibonacci;
--
--     for I in 0 .. Max loop
--        Put_Line (I'Image & ": \" & Fib (I)'Image);
--     end loop;
--  end lFibonacci;
