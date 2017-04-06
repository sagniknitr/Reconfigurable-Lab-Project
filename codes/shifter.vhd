----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2017 01:09:59
-- Design Name: 
-- Module Name: shifter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter is
    Port ( shsel : in STD_LOGIC_VECTOR (1 downto 0);
           A : in STD_LOGIC_VECTOR (7 downto 0);
           F : out STD_LOGIC_VECTOR (7 downto 0));
end shifter;

architecture Behavioral of shifter is

begin

process(shsel,A)
begin 
  case shsel is 
         WHEN "00" => F <= A;                    --pass
         WHEN "01" => F <= A (6 downto 0) & '0';  --shift right
         WHEN "10" => F <= '0' & A(7 downto 1);   --shift left
         WHEN others => F <= A(0) & A(7 downto 1);  --rotate
        
    end case;     
end process;

end Behavioral;
