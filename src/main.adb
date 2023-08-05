with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Integer_Text_IO;      use Ada.Integer_Text_IO;
with Ada.Numerics.Big_Numbers; use Ada.Numerics.Big_Numbers;
with Ada.Strings;
with Ada.Strings.Unbounded;

procedure Main is

   --  ADA 2022 big int version
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

   procedure fun_Fibonacci is
      --  Max : constant := 1_000;
      Max : constant := 10;

      function Fib (N : Positive) return Natural is
      begin
         if N = 1 or N = 2 then
            return 1;
         else
            return Fib (N - 1) + Fib (N - 2);
         end if;
      end Fib;

   begin
      for I in 1 .. Max loop
         Put_Line (I'Image & ": \" & Fib (I)'Image);
      end loop;
   end fun_Fibonacci;

   function fibonacci_digit (n : Integer) return Integer is
   begin
      if n = 0 then
         return 0;
      elsif n = 1 then
         return 1;
      else
         return fibonacci_digit (n - 1) + fibonacci_digit (n - 2);
      end if;
   end fibonacci_digit;

   function fibonacci_full (n : Integer) return String is
      tmpFibStr : String := "";
   begin
      for i in 1 .. n loop
         tmpFibStr := tmpFibStr & Integer'Image (fibonacci_digit (i));
      end loop;
      return tmpFibStr;
   end fibonacci_full;

   function Fibonacci
     (n : Integer) return Ada.Strings.Unbounded.Unbounded_String
   is
      S : Ada.Strings.Unbounded.Unbounded_String;
      T : String := "01";
   begin
      for i in 2 .. n loop
         T := T & Integer'Image (fibonacci_digit (i));
      end loop;
      S := Ada.Strings.Unbounded.To_Unbounded_String (T);

      return S;
   end Fibonacci;

   tmpVar : Ada.Strings.Unbounded.Unbounded_String;

begin

   Put_Line ("Hello World! ");
   tmpVar := Fibonacci (1);

   Put_Line (Ada.Strings.Unbounded.To_String (tmpVar));
   fun_Fibonacci;
end Main;
