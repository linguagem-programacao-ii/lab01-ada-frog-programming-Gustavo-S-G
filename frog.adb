with Ada.Integer_Text_IO;
with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure frog is
   P : Integer := 0;
   N : Integer := 0;
   X : Integer := 0;
   Y : Integer := 0;
   
   subtype Random_Range is Integer range 1 .. 10;
   package R is new Ada.Numerics.Discrete_Random (Random_Range);
   use R;
   G : Generator;
   
   type MY_ARRAY is array(2..101) of Integer;
   Data : MY_ARRAY;
   
begin
   --P = frog jump height(1/5) / N = number of pipes(2/100)
   
   P := Integer'Value(Get_Line); N := Integer'Value(Get_Line);
   
   New_Line(1);
   
   --Gera o tamanho dos pipes entre 1 e 10
   Reset (G);
   for I in 2 .. N + 1 loop
      Data(I) := Random (G);
   end loop;
   
   --Mostra o tamanho de cada pipe
   for I in 2 .. N + 1 loop
      if Data(I) > 0 then
        Ada.Integer_Text_IO.Put(Data(I));
    end if;
   end loop;
   
   New_Line(2);
   
   --Verifica se você ganhou ou perdeu o game
   for I in 2 .. N + 1 loop
      Y := N;
      If Data(I + 1) - Data(I) >= P then
         Put_Line("GAME OVER");
         exit;
      elsif Data(I) - Data(I + 1) >= P then
         Put_Line("GAME OVER");
         exit;
      elsif Data(I) = Y then
         Put_Line("YOU WIN");
         exit;
      end if;
   end loop;
   
end frog;
