library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SUMADOR4BITS is
   port
   (
      nibble1, nibble2,nibble3 : in unsigned(3 downto 0); 

      sum       : out unsigned(3 downto 0); 
      carry_out : out std_logic
   );
end entity SUMADOR4BITS;
 
architecture Behavioral of SUMADOR4BITS is
   signal temp : unsigned(4 downto 0); 
begin 
   temp <= ("0" & nibble1) + nibble2+nibble3; 
   -- OR use the following syntax:
   -- temp <= ('0' & nibble1) + ('0' & nibble2);

   sum       <= temp(3 downto 0); 
   carry_out <= temp(4);
end architecture Behavioral;