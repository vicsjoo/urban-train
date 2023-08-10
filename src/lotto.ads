with Ada.Text_IO; use Ada.Text_IO;
--  with Ada.Text_IO.Integer_IO; use Ada.Text_IO.Integer_IO;
--  with Ada.Text_IO.Float_IO; use Ada.Text_IO.Float_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers; use Ada.Containers;
--  with Ada.Containers.Ordered_Sets; use Ada.Containers.Ordered_Sets;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Finalization; use Ada.Finalization;

package lotto is
    subtype Number_Range is Integer range 1 .. 60;
    type Lottery_Numbers is array (1 .. 60) of Boolean;
    function Generate_Lottery_Pick return String;
end lotto;
