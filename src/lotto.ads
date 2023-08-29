with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
with fib; use fib;
with System;           use System;

package lotto is
   type Int_Array is array (Positive range <>) of Integer;
   procedure Lottery;

end lotto;
