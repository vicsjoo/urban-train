with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings;
with Ada.Strings.Unbounded;


procedure Main is

   function fibonacci_digit(n : integer) return integer is
   begin
      if n = 0 then
         return 0;
      elsif n = 1 then
         return 1;
      else
         return fibonacci_digit(n - 1) + fibonacci_digit(n - 2);
      end if;
   end fibonacci_digit;

   function fibonacci_full(n : integer) return string  is
      tmpFibStr: string := "";
   begin
      for i in 1..n loop
         tmpFibStr := tmpFibStr & Integer'Image(fibonacci_digit(i));
         end loop;
      return tmpFibStr;
      end fibonacci_full;


  function Fibonacci(n : integer) return Ada.Strings.Unbounded.Unbounded_String is
    S : Ada.Strings.Unbounded.Unbounded_String;
    T : String := "01";
   begin
    for i in 2..n loop
        T := T & Ada.Strings.Unbounded.To_String(Fibonacci(i));
      end loop;
    S := Ada.Strings.Unbounded.To_Unbounded_String(T);

      return S;
end Fibonacci;

   tmpVar : Ada.Strings.Unbounded.Unbounded_String;

begin



   Put_Line ("Hello World! ");
   tmpVar := Fibonacci(1);

   Put_Line(Ada.Strings.Unbounded.To_String(tmpVar));

   end Main;


