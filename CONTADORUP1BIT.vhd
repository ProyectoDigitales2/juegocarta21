library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  
use IEEE.STD_LOGIC_ARITH.ALL;  
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
	   
entity random1BIT is  
	   port( Clock: in std_logic;  
            Reset: in std_logic;  
            Enable: in std_logic;  
	         Q: Buffer std_logic_vector(3 downto 0));  
end random1BIT;  
	   
architecture ARQran of random1BIT is  
--signal temp: std_logic_vector(3 downto 0);  
begin     
process(Clock,Reset)  
   begin  
      if Reset='1' then Q <= '0';  
         --Q <= temp;  
      elsif(Clock'event and Clock='1') then  
              if Q='1' then  Q<='0'; else Q<='0' end if;	
      end if;  
end process;  
end ARQran;  
