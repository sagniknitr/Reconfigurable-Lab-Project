----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2017 11:15:53
-- Design Name: 
-- Module Name: acc - Behavioral
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

entity acc is
    Port ( clk_1 : in STD_LOGIC;
           rst : in STD_LOGIC;
           wr : in STD_LOGIC; 
           input : in STD_LOGIC_VECTOR (7 downto 0);
           output_1 : out STD_LOGIC_VECTOR (7 downto 0));
end acc;

architecture Behavioral of acc is

begin

process(clk_1,rst)
  begin
    if rst = '1' then
       output_1 <= "00000000" ;
    elsif   clk_1'event and clk_1 = '1' then
       output_1 <=input;
    end if;

end process;
end Behavioral;
