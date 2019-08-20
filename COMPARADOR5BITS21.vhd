library ieee;  
use ieee.std_logic_1164.all;  
  
entity COMPARADOR5BITS21 is  
port (A, B: in std_logic_vector(4 downto 0);  
        VJ1, empate, VJ2: out std_logic);  
end COMPARADOR5BITS21;  
  
architecture ARQcomp21 of COMPARADOR5BITS21 is  
begin  
process(A, B)  
begin  
    if (A>B)and(A<"10110")  then VJ1<='1'; empate<='0'; VJ2<='0';  
    elsif (B>A)and(B<"10110") then VJ1<='0'; empate<='0'; VJ2<='1';
	 elsif (B<A)and(A>"10110") then VJ1<='0'; empate<='0'; VJ2<='1'; 	 
	 elsif (A<b)and(B>"10110") then VJ1<='1'; empate<='0'; VJ2<='0'; 	
    else VJ1<='0'; empate<='1'; VJ2<='0';  
    end if;  
end process;  
end ARQcomp21;  

