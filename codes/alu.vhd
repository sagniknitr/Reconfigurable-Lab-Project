----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2017 00:35:29
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity alu is
    Port ( alusel : in STD_LOGIC_VECTOR (2 downto 0);
           A,B : in STD_LOGIC_VECTOR (7 downto 0);
           F : out STD_LOGIC_VECTOR (7 downto 0));
end alu;

architecture Behavioral of alu is

begin

process(alusel,A,B)
begin 
  case alusel is
         WHEN "000" => F <= A;        --pass
         WHEN "001" => F <= A AND B;  --And
         WHEN "010" => F <= A OR B;   --or
         WHEN "011" => F <= NOT A;    --not
         WHEN "100" => F <= A + B;    --add
         WHEN "101" => F <= A - B;    --Subtact
         WHEN "110" => F <= A + 1;    --increment
         WHEN others => F <= A - 1;    --decrement
    end case;     
end process;
end Behavioral;
