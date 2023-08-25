package body fib is

   procedure fibonacci is
      Max : constant := 10;

   begin
      for I in 1 .. Max loop
         Put_Line (I'Image & ": \" & Fib_Func (I)'Image);
      end loop;
   end fibonacci;

   function Fib_Func (N : Positive) return Natural is
      begin
         if N = 1 or N = 2 then
            return 1;
         else
            return Fib_Func (N - 1) + Fib_Func (N - 2);
         end if;
      end Fib_Func;
end fib;
