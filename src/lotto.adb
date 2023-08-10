package body lotto is

procedure Lottery is
      function Generate_Lottery_Pick return String is
         Picks : array (1..6) of Integer;
         Result : String (1..17);  -- "01-02-03-04-05-06" + null terminator

         Random_Generator : System.Random.Generator;
         
         -- Subprogram to swap two elements in an array
         procedure Swap(Item1, Item2 : in out Integer) is
            Temp : Integer := Item1;
         begin
            Item1 := Item2;
            Item2 := Temp;
         end Swap;
         
      begin
         -- Initialize random number generator
         System.Random.Reset (Generator => Random_Generator, Seed => Clock);
         
         Ada.Text_IO.Put_Line("Generating lottery numbers...");
         for i in Picks'Range loop
            for j in 1..i loop
               loop
                  Picks(i) := Integer (1 + System.Random (Generator => Random_Generator)) mod 60 + 1;
                  declare
                     HasDuplicate : Boolean := False;
                  begin
                     for k in 1..i-1 loop
                        if Picks(i) = Picks(k) then
                           HasDuplicate := True;
                           exit;
                        end if;
                     end loop;
                     exit when not HasDuplicate;
                  end;
               end loop;
            end loop;
         end loop;

         -- Sort the numbers in ascending order
         for i in Picks'Range loop
            for j in i + 1 .. Picks'Last loop
               if Picks(i) > Picks(j) then
                  Swap(Picks(i), Picks(j));
               end if;
            end loop;
         end loop;

         -- Convert the numbers to a formatted string
         Result := Picks(1)'Image & "-" & Picks(2)'Image & "-" &
                   Picks(3)'Image & "-" & Picks(4)'Image & "-" &
                   Picks(5)'Image & "-" & Picks(6)'Image;
         
         return Result;
      end Generate_Lottery_Pick;

      package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
      use Integer_IO;

   begin
      Ada.Text_IO.Put_Line(Generate_Lottery_Pick);
   end Lottery;

end lotto;
