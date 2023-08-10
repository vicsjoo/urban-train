package body lotto is

   procedure Lottery is
   function Generate_Lottery_Pick return String is
         type Int_Range is range 1..60;
         type Pick_Length is range 1..6;
         type Lottery_Pick_Array_Type is array (Pick_Length) of Integer;
         Lottery_Pick_Array : Lottery_Pick_Array_Type;
         tmpStr : String := "";
         Max_Result_Length : Integer := (2 * Integer(Pick_Length'Last)) + (Integer(Pick_Length'Last) - 1);
         Result : String (1..Max_Result_Length);  -- "01-02-03-04-05-06" + null terminator (should be 17)
         Random_Number : Int_Range;
         package Rand_Int is new Ada.Numerics.Discrete_Random(Int_Range);
         --  use Rand_Int;
         Rand_Gen : Rand_Int.Generator;

         
         
         
      begin
         for Index in Lottery_Pick_Array'Range loop
  
               Random_Number := Rand_Int.Random(Rand_Gen);
         
               Lottery_Pick_Array(Index) := Integer(Random_Number);
      
         end loop;

         -- Construct the Result string
         declare
            Number_String : String(1..2); -- String to hold the formatted number
         begin
            Number_String := Integer'Image(Lottery_Pick_Array(1));
            if Lottery_Pick_Array(1) < 10 then
               Number_String(1) := '0'; -- Add leading zero
            end if;
            Result := Number_String;
         end;

         for Index in 2..Pick_Length'Last loop
            declare
               Number_String : String(1..2); -- String to hold the formatted number
            begin
               Number_String := Integer'Image(Lottery_Pick_Array(Index));
               if Lottery_Pick_Array(Index) < 10 then
                  Number_String(1) := '0'; -- Add leading zero
               end if;
               Result := Result & "-" & Number_String;
            end;
         end loop;

         return Result;
      end Generate_Lottery_Pick;
     

   package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
   use Integer_IO;

begin
      -- Call the function to generate a random lottery pick
      Ada.Text_IO.Put_Line(Generate_Lottery_Pick);
     
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
