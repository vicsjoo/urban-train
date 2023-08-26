package body lotto is
   procedure Lottery is

      function Resize_Array (A : Int_Array) return Int_Array is
         New_A : Int_Array (1 .. A'Length);
         I     : Natural := 1;
      begin
         for J in A'Range loop
            if A (J) /= 0 then
               New_A (I) := A (J);
               I         := I + 1;
            end if;
         end loop;
         return New_A (1 .. I - 1);
      end Resize_Array;

      function Generate_Lottery_Pick
        (maxNum      : Integer := 60; maxLen : Integer := 6;
         isFibonacci : Boolean := False) return String
      is

         -- Since we are looping over an empty initialized, supress the warning
         pragma Warnings (Off, "may be referenced before it has a value");
         -- Temporarily supress unreachable code
         pragma Warnings (Off, "unreachable code");

         --  Declare our interval of allowed numbers from 1 to 60
         subtype Int_Range is Integer range 1 .. maxNum;

         --  Defines the length of our pick
         subtype Pick_Length is Integer range 1 .. maxLen;

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
         Max_Result_Length : Integer := (3 * (Pick_Length'Last) - 1);

         -- Create an empty string with size Max_Result_Length
         Result : String
           (1 .. Max_Result_Length); -- "01-02-03-04-05-06" length

         -- Defines the character of our Delimiter
         Delimiter : constant Character := '-';

         -- Creates a new string to store the partials of our Lottery_Pick
         Partial_Result : String (1 .. 3);

         -- Import and instatiate the random number generator
         package Rand_Int is new Ada.Numerics.Discrete_Random (Int_Range);

         -- Declare temporary sorting integer
         Temp_Sort : Integer;

         -- Declare temporary string/character to hold single digit integer
         Temp_CharStr : String (1 .. 2);

         -- Create a new instance of the random number generator
         Rand_Gen : Rand_Int.Generator;

      begin
         Rand_Int.Reset (Rand_Gen);
         for Index in Lottery_Pick_Array'Range loop

            -- Generate random numbers until Array'Range
            Random_Number := (Rand_Int.Random (Rand_Gen));

            -- Iterates over the array to see if the number is duplicate
            <<Inception>>
            for Index in 1 .. (Lottery_Pick_Array'Length - 1) loop
               --If it is a duplicate, generate another number
               if Random_Number = Lottery_Pick_Array (Index) then

                  Random_Number := (Rand_Int.Random (Rand_Gen));
                  --  Put_Line("Inception check");
                  goto Inception;
                  exit;

               end if;
            end loop;
            -- Now we add our non-duplicate Random_Number to the array.
            Lottery_Pick_Array (Index) := Random_Number;

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

         -- Generate a Fibonacci array and chooses a random amount of fibonacci numbers to fit in the sequence
         if isFibonacci then
            declare

               -- Define temporary Fibonacci_Array
               Temp_Fibonacci_Array : array (1 .. maxNum) of Integer;
               Fib_Count            : Integer := 0;
            begin
               for i in 1 .. maxNum loop
                  -- Since our array is already in ascending order at this point we just check if
                  -- our fibonacci number is less than the last number of the array
                  if Fib_Func (i + 1) <= maxNum then
                     Temp_Fibonacci_Array (i) := Fib_Func (i + 1);
                     Fib_Count                := Fib_Count + 1;
                     Put_Line(Integer'Image(Temp_Fibonacci_Array(i)));
                  else
                     exit;
                  end if;



               end loop;


            end;


         end if;

         -- Iterates over the array and builds the string

         for i in Lottery_Pick_Array'Range loop

            --  If our number is less than 10 add leading zero
            if Lottery_Pick_Array (i) < 10 then
               Result ((i) * 3 - 2) := '0';
               Temp_CharStr := (Integer'Image (Lottery_Pick_Array (i)));
               Result ((i) * 3 - 1) := Temp_CharStr (2);
               --  Put_Line(Result);
            else
               --  If it is not less than 10 add it to our Partial_Result
               Partial_Result := Integer'Image (Lottery_Pick_Array (i));
         --  Then iterate over the partial result and modify according digits
               for j in Partial_Result'Range loop
                  Result ((i) * 3 - 2) := Partial_Result (2);
                  Result ((i) * 3 - 1) := Partial_Result (3);
               end loop;
            end if;

            -- If we are on a spot that should be a delimiter, we add the delimiter to our string
            if (((i) * 3) mod 3) = 0 and i /= Lottery_Pick_Array'Last then
               Result ((i) * 3) := Delimiter;
            end if;

         end loop;
         return Result;
      end Generate_Lottery_Pick;

   begin
      -- Call the function to generate a random lottery pick
      -- Print the generated number
      Ada.Text_IO.Put_Line (Generate_Lottery_Pick (25, 15, True));
   end Lottery;
end lotto;
