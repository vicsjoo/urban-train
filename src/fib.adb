package body fib is

   procedure fibonacci is
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
   end fibonacci;

end fib;
