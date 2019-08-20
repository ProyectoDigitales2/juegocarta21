LIBRARY IEEE;  
USE  IEEE.STD_LOGIC_1164.all;  	USE  IEEE.STD_LOGIC_UNSIGNED.all;  
	  
ENTITY mss_21 IS  
    PORT(clock,reset,start,turno,repartir,pasar,ganador,turno_reg,comp_1s,comp_3veces,GJ1,GJ2,empate,comp_3s,ganador_10,
	 victoria_J1,victoria_J2:IN STD_LOGIC;
	 en_turno,en_J1C1,en_J1C2,en_J1C3,en_J2C1,en_J2C2,en_J2C3,en_1seg,en_3seg,en_3veces,en_victorias,en_10partidas,en_VJ2,
	 en_VJ1,rst_cartas,rst_1seg,rst_3seg,rst_3veces,rst_victorias,rst_10partidas,rst_VJ2,rst_VJ1,en_dispJ1,en_dispJ2,VJ1_led,VJ2_led,empate_led:OUT STD_LOGIC;
	 estados:	out std_logic_vector(5 downto 0));  
END mss_21;  
  
 
ARCHITECTURE ARQ_21 OF mss_21 IS  
Type estado is (P1,P2,P3,P4,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16,B17,B18,B19,B20,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20);  
SIGNAL y:estado;  
BEGIN  
PROCESS(clock,reset)  
      BEGIN  
          if reset='0' then y<=A0;  
          elsif (clock'event and clock='1') then  
              case y is  
						when A0=> if start='1' then y<=A1; else y<=A0; end if;  
                  when A1=> if start='0' then y<=A2; else y<=A1; end if;    
                  when A2=> if turno='1'and ganador='0' then y<=A3;elsif turno='0'and ganador='1' then y<=A6; else y<=A2;end if;      
                  when A3=> if turno='0' then y<=A4;else y<=A3;end if; 
						when A4=> if turno_reg='0' then y<=B1;else y<=C1;end if;
                  when A5=> if ganador='0' then y<=A6;else y<=A5;end if;   
                  when A6=> if ganador_10='0' then y<=A2;else y<=A7;end if;   
                  when A7=> if victoria_J1='1'and victoria_J2='0' then y<=A8;elsif victoria_J1='0'and victoria_J2='1' then y<=A12; else y<=B18;end if;
						when A8=> if comp_1s='1' then y<=A9;else y<=A8;end if;
						when A9=>  y<=A10;
						when A10=> if comp_1s='1' then y<=A11;else y<=A10;end if;
                  when A11=> if comp_3veces='0' then y<=A8;else y<=A2;end if;   
                  when A12=> if comp_1s='1' then y<=A13;else y<=A12;end if;       
                  when A13=> y<=A14;
						when A14=> if comp_1s='1' then y<=A15;else y<=A14;end if; 
						when A15=> if comp_3veces='0' then y<=A12;else y<=A2;end if;   
                  when B1=>  if comp_1s='1' then y<=B2;else y<=B1;end if;  
                  when B2=>  y<=B3;
                  when B3=>  if comp_1s='1' then y<=B4;else y<=B3;end if;
						when B4=>  if comp_3veces='1' then y<=B5;else y<=B1;end if;
                  when B5=>  if repartir='1' then y<=B6;else y<=B5;end if;  
                  when B6=>  if repartir='0' then y<=B7;else y<=B6;end if;    
                  when B7=>  if pasar='1'and repartir='0' then y<=B8;elsif pasar='0'and repartir='1' then y<=B9; else y<=B7;end if;
						when B8=>  if pasar='0' then y<=P1;else y<=B8;end if; ----------------------------------
						when P1=>  if turno_reg='0' then y<=C5;else y<=B15;end if; ---------------------
						when B9=>  if repartir='0' then y<=B10;else y<=B9;end if;
						when B10=> if pasar='1'and repartir='0' then y<=B11;elsif pasar='0'and repartir='1' then y<=B12; else y<=B10;end if;
                  when B11=> if pasar='0' then y<=P2;else y<=B11;end if; -----------------------  
						when P2=>  if turno_reg='0' then y<=C5;else y<=B15;end if;------------------
                  when B12=> if repartir='0' then y<=B13;else y<=B12;end if; 
                  when B13=> if turno_reg='0' then y<=C5;else y<=B14;end if;
						when B14=> if GJ1='1'and empate='0' then y<=B15;elsif GJ1='0'and empate='1' then y<=B17; else y<=B19;end if; 
						when B15=> y<=B16;
                  when B16=> if comp_3s='1' then y<=A2;else y<=B16;end if;  
                  when B17=> y<=B18;  
                  when B18=> if comp_3s='1' then y<=A2;else y<=B18;end if; 
	               when B19=> y<=B20;  
                  when B20=> if comp_3s='1' then y<=A2;else y<=B20;end if; 				
			         when C1=>  if comp_1s='1' then y<=C2;else y<=C1;end if;  
                  when C2=>  y<=C3;
                  when C3=>  if comp_1s='1' then y<=C4;else y<=C3;end if;
						when C4=>  if comp_3veces='1' then y<=C5;else y<=C1;end if;
                  when C5=>  if repartir='1' then y<=C6;else y<=C5;end if;   
                  when C6=>  if repartir='0' then y<=C7;else y<=C6;end if;  
                  when C7=>  if pasar='1'and repartir='0' then y<=C8;elsif pasar='0'and repartir='1' then y<=C9; else y<=C7;end if;
						when C8=>  if pasar='0' then y<=P3;else y<=C8;end if; ------------
						when P3=>  if turno_reg='0' then y<=C14;else y<=B5;end if;----------------
						when C9=>  if repartir='0' then y<=C10;else y<=C9;end if;
						when C10=> if pasar='1'and repartir='0' then y<=C11;elsif pasar='0'and repartir='1' then y<=C12; else y<=C10;end if;
                  when C11=> if pasar='0' then y<=P4;else y<=C11;end if; ------------------------
						when P4=>  if turno_reg='0' then y<=C14;else y<=B5;end if;---------------
                  when C12=> if repartir='0' then y<=C13;else y<=C12;end if;   
                  when C13=> if turno_reg='1' then y<=B5;else y<=C14;end if;
						when C14=> if GJ2='1'and empate='0' then y<=C15;elsif GJ2='0'and empate='1' then y<=C17; else y<=C19;end if;
						when C15=> y<=C16;
                  when C16=> if comp_3s='1' then y<=A2;else y<=C16;end if;   
                  when C17=> y<=C18;   
                  when C18=> if comp_3s='1' then y<=A2;else y<=C18;end if;
	               when C19=> y<=C20; 
                  when C20=> if comp_3s='1' then y<=A2;else y<=C20;end if;
             end case;  
         end if;  
END PROCESS;  
      
PROCESS(y)  
    BEGIN  
        en_turno<='0';en_J1C1<='0';en_J1C2<='0';en_J1C3<='0';en_J2C1<='0';en_J2C2<='0';en_J2C3<='0';en_1seg<='0';en_3seg<='0';en_3veces<='0';en_victorias<='0';
		  en_10partidas<='0';en_VJ2<='0';en_VJ1<='0';rst_cartas<='0';rst_1seg<='0';rst_3seg<='0';rst_3veces<='0';rst_victorias<='0';rst_10partidas<='0';rst_VJ2<='0';
		  rst_VJ1<='0';estados<="000000";en_dispJ1<='0';en_dispJ2<='0';VJ1_led<='0';VJ2_led<='0';empate_led<='0';
        case y is  
						when A0=>  estados<="111111"; --reiniciar disp
                  when A1=>  rst_cartas<='1';rst_1seg<='1';rst_3seg<='1';rst_3veces<='1';rst_victorias<='1';rst_10partidas<='1';rst_VJ2<='1';rst_VJ1<='1';estados<="000001"; 
                  when A2=>  rst_cartas<='1';rst_1seg<='1';rst_3seg<='1';rst_3veces<='1';estados<="000011"; 
                  when A3=>  en_turno<='1';estados<="000100"; 
						when A4=>  estados<="000101"; --
                  when A5=>  estados<="000110"; --
                  when A6=>  estados<="000111"; --
                  when A7=>  estados<="001000"; --
						when A8=>  en_1seg<='1';en_dispJ1<='1';estados<="001001"; 
						when A9=>  rst_1seg<='1';estados<="001010"; 
						when A10=> en_1seg<='1';estados<="001011"; 
                  when A11=> en_3veces<='1';rst_1seg<='1';estados<="001100"; 
                  when A12=> en_1seg<='1';en_dispJ2<='1';estados<="001101"; 
                  when A13=> rst_1seg<='1';estados<="001110"; 
						when A14=> en_1seg<='1';estados<="001111"; 
						when A15=> en_3veces<='1';rst_1seg<='1';estados<="010000"; 
                  when B1=>  en_1seg<='1';en_dispJ1<='1';estados<="010001"; 
                  when B2=>  rst_1seg<='1';estados<="010010"; 
                  when B3=>  en_1seg<='1';estados<="010011"; 
						when B4=>  en_3veces<='1';rst_1seg<='1';estados<="010100"; 
                  when B5=>  rst_3veces<='1';rst_1seg<='1';estados<="010101"; 
                  when B6=>  en_J1C1<='1';estados<="010110"; 
                  when B7=>  estados<="010111"; 
						when B8=>  estados<="011000"; 
						when P1=>  estados<="000000";
						when B9=>  en_J1C2<='1';estados<="011001"; 
						when B10=> estados<="011010"; 
                  when B11=> estados<="011011"; 
						when P2=>  estados<="000000";
                  when B12=> en_J1C3<='1';estados<="011100"; 
                  when B13=> estados<="011101"; 
						when B14=> estados<="011110"; 
						when B15=> en_VJ1<='1';en_10partidas<='1';estados<="011111"; 
                  when B16=> VJ1_led<='1';en_3seg<='1';estados<="100000"; 
                  when B17=> en_10partidas<='1';estados<="100001"; 
                  when B18=> empate_led<='1';en_3seg<='1';estados<="100010"; 
	               when B19=> en_VJ2<='1';en_10partidas<='1';estados<="100011"; 
                  when B20=> VJ2_led<='1';en_3seg<='1';estados<="100100"; 
			         when C1=>  en_1seg<='1';en_dispJ2<='1';estados<="100101"; 
                  when C2=>  rst_1seg<='1';estados<="100110"; 
                  when C3=>  en_1seg<='1';estados<="100111"; 
						when C4=>  en_3veces<='1';rst_1seg<='1';estados<="101000"; 
                  when C5=>  rst_3veces<='1';rst_1seg<='1';estados<="101001"; 
                  when C6=>  en_J2C1<='1';estados<="101010"; 
                  when C7=>  estados<="101011"; 
						when C8=>  estados<="101100"; 
						when P3=>  estados<="000000";
						when C9=>  en_J2C2<='1';estados<="101101"; 
						when C10=> estados<="101110"; 
                  when C11=> estados<="101111"; 
						when P4=>  estados<="000000";	
                  when C12=> en_J2C3<='1';estados<="110000"; 
                  when C13=> estados<="110001"; 
						when C14=> estados<="110010"; 
						when C15=> en_VJ2<='1';en_10partidas<='1';estados<="110011"; 
                  when C16=> VJ2_led<='1';en_3seg<='1';estados<="110100"; 
                  when C17=> en_10partidas<='1';estados<="110101"; 
                  when C18=> empate_led<='1';en_3seg<='1';estados<="110110"; 
	               when C19=> en_VJ1<='1';en_10partidas<='1';estados<="110111"; 
                  when C20=> VJ1_led<='1';en_3seg<='1';estados<="111000"; 
        end case;  
END PROCESS;  
END ARQ_21; 