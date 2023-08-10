package body lotto is
   procedure Lottery is
      function Generate_Lottery_Pick return String is

         --  Declare our interval of allowed numbers from 1 to 60
         type Int_Range is range 1 .. 60;

         --  Defines the length of our pick
         type Pick_Length is range 1 .. 6;

         --  Defines a type of array based on the length of our pick
         type Lottery_Pick_Array_Type is
           array (1 .. Pick_Length'Last) of Integer;

         --  Create a new array of our custom type
         Lottery_Pick_Array : Lottery_Pick_Array_Type;

         --  Integer to store a random number
         Random_Number : Integer := 0;

         -- Boolean to check for duplicates
         Duplicate : Boolean := False;

         -- Calculates the maximum size of our string, including the Delimiter and leading zeros based on Pick_Length'Last
         Max_Result_Length : Integer := (3 * Integer (Pick_Length'Last) - 1);

         -- Create an empty string with size Max_Result_Length
   --  Result : String (1 .. Max_Result_Length); -- "01-02-03-04-05-06" length

         Result : String := "01-02-03-04-05-06"; -- "01-02-03-04-05-06" length

         -- Defines the character of our Delimiter
         Delimiter : constant Character := '-';

         -- Creates a new string to store the partials of our Lottery_Pick
         --  Partial_Result : String (1 .. 2);
         Partial_Result : String := "00";

         -- Import and instatiate the random number generator
         package Rand_Int is new Ada.Numerics.Discrete_Random (Int_Range);
         Rand_Gen : Rand_Int.Generator;

      begin
         Rand_Int.Reset (Rand_Gen);
         for Index in Lottery_Pick_Array'Range loop
            -- Generate random numbers until Array'Range
            Random_Number := Integer (Rand_Int.Random (Rand_Gen));

            -- Iterates over the array to see if the number is duplicate
            for Index in Lottery_Pick_Array'Range loop
               while Random_Number = Lottery_Pick_Array (Index) loop
                  -- While it is a duplicate, generate another number
                  Put_Line ("We duplicated it bitch lol");
                  Random_Number := Integer (Rand_Int.Random (Rand_Gen));
               end loop;
            end loop;
            -- Now we add our non-duplicate Random_Number to the array.
            Lottery_Pick_Array (Index) := Random_Number;
            Put_Line (Integer'Image (Random_Number));

         end loop;

         -- Print the generated number

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
