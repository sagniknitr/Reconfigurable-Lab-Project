----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2017 13:12:54
-- Design Name: 
-- Module Name: reg_file - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_file is
    Port ( clk_2 : in STD_LOGIC;
           wr : in STD_LOGIC;  
           addr : in STD_LOGIC_VECTOR (2 downto 0);
           in_rf : in STD_LOGIC_VECTOR (7 downto 0);
           out_rf : out STD_LOGIC_VECTOR (7 downto 0));
          
end reg_file;

architecture Behavioral of reg_file is

SUBTYPE reg IS STD_LOGIC_VECTOR(7 DOWNTO 0);
 TYPE regArray IS array(0 to 3) OF reg;
  SIGNAL RF : regArray;

begin
 PROCESS(clk_2)
  begin
   IF(clk_2'EVENT AND clk_2='1') THEN 
      IF(wr='1')THEN RF(CONV_INTEGER(addr))<=in_rf;
      else
       out_rf <= RF(CONV_INTEGER(addr));
      end if;
   end if;
   end process;
   
 
end Behavioral;

    