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
         Partial_Result : String (1 .. 3);
         --  Partial_Result : String := "00";

         -- Import and instatiate the random number generator
         package Rand_Int is new Ada.Numerics.Discrete_Random (Int_Range);

         -- Declare temporary sorting integer

         Temp_Sort : Integer;

         -- Declare temporary character to hold single digit integer
         Temp_CharStr : String (1..2);

         -- Create a new instance of the random number generator
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
                  --  Put_Line ("We duplicated it, lol");
                  Random_Number := Integer (Rand_Int.Random (Rand_Gen));
               end loop;
            end loop;
            -- Now we add our non-duplicate Random_Number to the array.
            Lottery_Pick_Array (Index) := Random_Number;
            --  Put_Line (Integer'Image (Random_Number));

         end loop;

         -- Sort the numbers in ascending order : Reverse Bubble Sort
         for i in Lottery_Pick_Array'Range loop
            for j in reverse Lottery_Pick_Array'First .. i - 1 loop
               if Lottery_Pick_Array (j) > Lottery_Pick_Array (j + 1) then
                  Temp_Sort                  := Lottery_Pick_Array (j);
                  Lottery_Pick_Array (j)     := Lottery_Pick_Array (j + 1);
                  Lottery_Pick_Array (j + 1) := Temp_Sort;
               end if;
            end loop;
         end loop;

         --  Debug the array
         --  for i in Lottery_Pick_Array'Range loop
         --     Put_Line (Integer'Image (Lottery_Pick_Array (i)));
         --  end loop;

         -- Iterates over the array and builds the string

         for i in Lottery_Pick_Array'Range loop


            --  If our number is less than 10 add leading zero
            if Lottery_Pick_Array (i) < 10 then
               Result(Integer(i) * 3 - 2) := '0';
               Temp_CharStr := (Integer'Image(Integer(Lottery_Pick_Array(i))));
               Result(Integer(i) * 3 - 1) := Temp_CharStr(2);
               --  Put_Line(Result);
            else
            --  If it is not less than 10 add it to our Partial_Result
               Partial_Result := Integer'Image(Integer(Lottery_Pick_Array (i)));
               --  Then iterate over the partial result and modify according digits
               for j in Partial_Result'Range loop
                  Result(Integer(i) * 3 - 2) := Partial_Result(2);
                  Result(Integer(i) * 3 - 1) := Partial_Result(3);
end loop;
            end if;

            -- If we are on a spot that should be a delimiter, we add the delimiter to our string
            if ((Integer(i) * 3) mod 3) = 0 and i /= Lottery_Pick_Array'Last then
               Result(Integer(i)*3) := Delimiter;
            end if;

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
