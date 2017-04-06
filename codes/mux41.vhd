----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2017 01:24:45
-- Design Name: 
-- Module Name: mux41 - Behavioral
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

entity mux41 is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           D3,D2,D1,D0 : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR(7 downto 0));
end mux41;

architecture Behavioral of mux41 is

begin
process(S,D3,D2,D1,D0)
begin 
  case S is 
         WHEN "00" => Y <= D0;                    
         WHEN "01" => Y <= D1; 
         WHEN "10" => Y <= D2; 
         WHEN others => Y <= D3; 
        
    end case;     
end process;

end Behavioral;
