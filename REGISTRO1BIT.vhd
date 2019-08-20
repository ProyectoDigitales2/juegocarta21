LIBRARY IEEE;  
USE  IEEE.STD_LOGIC_1164.all;  
USE  IEEE.STD_LOGIC_UNSIGNED.all;  
  
ENTITY REGISTRO1BIT IS  
    PORT(clock,reset,enable: IN STD_LOGIC;  
         Ent : IN STD_LOGIC;  
         Q : OUT STD_LOGIC);  
END REGISTRO1BIT;  
	  
ARCHITECTURE ARQreg OF REGISTRO1BIT IS  
	  
BEGIN  
    PROCESS(clock,reset)  
    BEGIN  
        if reset='1' then Q<='1';  
        elsif (clock'event and clock='1') then  
            if(enable='1') then Q<=Ent;  
            end if;  
        end if;  
    end process;  
END ARQreg;  
