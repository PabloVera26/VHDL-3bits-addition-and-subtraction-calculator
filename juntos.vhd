--code developed by Pablo Jahir Vera Sanchez
--Computational Embedded Systems Engineer
--Code used with FPGA DE10Lite

-- libraries used for the code
library ieee;
use ieee.std_logic_1164.all;

--here we create the entity, remember that the entity must be called as the file name
entity juntos is
port(--here we declare the variables for the architecture
a,b:in integer range 0 to 7;--variables declared for 3 bits
x: in std_logic;--this variable will decide if will be
HEX1,HEX2,HEX3,HEX4,HEX5,HEX6:out std_logic_vector(6 downto 0)--here is declared the BCD displays
);
end entity;
--here we started the architecture of the program
architecture arq of juntos is
signal mid: integer range -7 to 14;--here we declare a signal that will be where we are going to save the result
begin
with a select --here we show on the BCD display the number of a
HEX1 <="0000001"when 0,
       "1001111" when 1,
       "0010010" when 2,
       "0000110" when 3,
       "1001100" when 4,
       "0100100" when 5,
       "1100000" when 6,
       "0001111" when 7;
		 
with b select --here we show on the BCD display the number of b
HEX2 <= "0000001" when 0,
        "1001111" when 1,
        "0010010" when 2,
        "0000110" when 3,
        "1001100" when 4,
        "0100100" when 5,
        "1100000" when 6,
        "0001111" when 7;

process(x)--here is the process where will be decided if it will be addition or substraction
begin
if(x='0')then
mid<= a+b; --addition
HEX3<="1111111";--turn off the display
HEX6<="1110110";--I show the "=" symbol on the display
else
mid<=a-b; --substraction
HEX3<="1111110";--I show the "-" symbol on the display
HEX6<="1110110";--I show the "=" symbol on the display
end if;
end process;

process(mid)-- this is the process to show the results in the display
begin
if(mid<0)then-- this condition allow us to print number one in other display in case that the result is 2 numbers
HEX4 <= "1111110";
elsif(mid>9)then-- this condition allow us to in case the number is in a negative range is shown the "-" symbol
HEX4 <= "1001111";
else
HEX4<="1111111";
end if;
if(mid=-7)then
HEX5<="0001111";
elsif(mid=-6)then
HEX5<="1100000";
elsif(mid=-5)then
HEX5<="0100100";
elsif(mid=-4)then
HEX5<="1001100";
elsif(mid=-3)then
HEX5<="0000110";
elsif(mid=-2)then
HEX5<="0010010";
elsif(mid=-1)then
HEX5<="1001111";
elsif(mid=0)then
HEX5<="0000001";
elsif(mid=1)then
HEX5<="1001111";
elsif(mid=2)then
HEX5<="0010010";
elsif(mid=3)then
HEX5<="0000110";
elsif(mid=4)then
HEX5<="1001100";
elsif(mid=5)then
HEX5<="0100100";
elsif(mid=6)then
HEX5<="1100000";
elsif(mid=7)then
HEX5<="0001111";
ELSIF(mid=8) then
HEX5 <= "0000000";
ELSIF(mid=9) then
HEX5 <= "0000100";
ELSIF(mid=10) then
HEX5 <= "0000001";
ELSIF(mid=11) then
HEX5 <= "1001111";
ELSIF(mid=12) then
HEX5 <= "0010010";
ELSIF(mid=13) then
HEX5 <= "0000110";
ELSIF(mid=14) then
HEX5 <= "1001100";
else
HEX5<="1111111";
end if;
end process;
end arq;
