with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

with System;           use System;

package lotto is
   procedure Lottery;
   subtype Number_Range is Integer range 1 .. 60;
   type Lottery_Numbers is array (1 .. 60) of Boolean;

end lotto;
