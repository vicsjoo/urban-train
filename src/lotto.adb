package body lotto is
   procedure Lottery is
      function Generate_Lottery_Pick return String is
         type Int_Range is range 1 .. 60;
         type Pick_Length is range 1 .. 6;
         --  type Lottery_Pick_Array_Type is array (Pick_Length) of Integer;
         type Lottery_Pick_Array_Type is array (1 .. 6) of Integer;
         Lottery_Pick_Array : Lottery_Pick_Array_Type;
         --  Lottery_Pick_Array : Lottery_Pick_Array_Type;
         Random_Number     : Integer := 0;
         Max_Result_Length : Integer :=(3 * Integer (Pick_Length'Last));
         Result : String(1 ..Max_Result_Length);  -- "01-02-03-04-05-06" + null terminator (should be 18)
         package Rand_Int is new Ada.Numerics.Discrete_Random (Int_Range);
         Rand_Gen : Rand_Int.Generator;

      begin
         Rand_Int.Reset (Rand_Gen);
         for Index in Lottery_Pick_Array'Range loop
            -- Generate a random number within the allowed range
            Random_Number              := Integer (Rand_Int.Random (Rand_Gen));
            Lottery_Pick_Array (Index) := Random_Number;
            Ada.Text_IO.Put_Line
              (Lottery_Pick_Array (Index)'Image & " hello, index is: " &
               Index'Image);

         end loop;

         -- Construct the Result string
         --  Result := "01-02-03-04-05-06";
         Result := "ssssssssssssssssss";
         return Result;
      end Generate_Lottery_Pick;

   begin
      -- Call the function to generate a random lottery pick
      Ada.Text_IO.Put_Line (Generate_Lottery_Pick);
   end Lottery;
end lotto;
--  -- Sort the numbers in ascending order
--
--  -- Convert the numbers to a formatted string
--  Result := Picks(1)'Image & "-" & Picks(2)'Image & "-" &
--            Picks(3)'Image & "-" & Picks(4)'Image & "-" &
--            Picks(5)'Image & "-" & Picks(6)'Image;
--
--  return Result;

--  Result := "01-02-03-04-05-06";
--  Ada.Text_IO.Put_Line(Integer'Image(Max_Result_Length));
--  return Result;
