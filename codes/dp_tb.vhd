----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2017 01:56:11
-- Design Name: 
-- Module Name: dp_tb - Behavioral
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

entity dp_tb is
--  Port ( );
end dp_tb;

architecture Behavioral of dp_tb is
 
 component dp port( 
     clk_dp : IN std_logic;
     rst_dp : IN std_logic; 
     muxsel_dp : IN std_logic_vector(1 DOWNTO 0);
     imm_dp : IN std_logic_vector(7 DOWNTO 0);
     input_dp : IN std_logic_vector(7 DOWNTO 0);
     accwr_dp : IN std_logic; 
     rfaddr_dp : IN std_logic_vector(2 DOWNTO 0);
     rfwr_dp : IN std_logic; 
     alusel_dp : IN std_logic_vector(2 DOWNTO 0);
     shiftsel_dp : IN std_logic_vector(1 DOWNTO 0);
     outen_dp : IN std_logic;
    -- zero_dp : OUT std_logic;
    -- positive_dp : OUT std_logic;
     output_dp : OUT std_logic_vector(7 DOWNTO 0));
     end component;
     
      signal clk_dp : std_logic := '0';
      signal imm_dp,  input_dp :std_logic_vector(7 downto 0);
      signal output_dp : std_logic_vector(7 downto 0);
       constant clk_period : time := 1 ns;
       
      signal cntl_word : std_logic_vector(13 DOWNTO 0);
         begin
          
          
          UUT : dp port map(clk_dp => clk_dp,
                      rst_dp => cntl_word(10),
                      muxsel_dp => cntl_word(13 downto 12),
                      imm_dp => imm_dp,
                      input_dp => input_dp,
                  accwr_dp => cntl_word(11),
                  rfaddr_dp => cntl_word(8 downto 6),
             
                 
                 rfwr_dp => cntl_word(9),
                 alusel_dp => cntl_word(5 downto 3),
                   
                   shiftsel_dp => cntl_word(2 downto 1),
              
                  outen_dp => cntl_word(0),
                  --zero_dp => zero_dp,
                  --positive_dp => positive_dp,
                 output_dp => output_dp
                 );
          
          
          clk_process :process
                           begin
          
               clk_dp <= '0';
               wait for clk_period/2;  --for 0.5 ns signal is '0'.
               clk_dp <= '1';
               wait for clk_period/2;  --for next 0.5 ns signal is '1'.
          end process;
       
     
     
    
 


    --   UUT : dp port map(clk_dp => clk_dp,
    --    rst_dp => cntl_word(10),
    --    muxsel_dp(1) => cntl_word(13),
    --    muxsel_dp(0) => cntl_word(12),
    --    imm_dp => imm_dp,
    --    input_dp => input_dp,
    --    accwr_dp => cntl_word(11),
    --    rfaddr_dp(2) => cntl_word(8),
    --    rfaddr_dp(1) => cntl_word(7),
    --    rfaddr_dp(0) =>  cntl_word(6),
    --    rfwr_dp => cntl_word(9),
    --    alusel_dp(2) => cntl_word(5),
    --     alusel_dp(1) =>  cntl_word(4),
    --      alusel_dp(0) => cntl_word(3),
    --     shiftsel_dp(1) => cntl_word(2),
    --     shiftsel_dp(0) =>  cntl_word(1),
    --    outen_dp => cntl_word(0),
    --    zero_dp => zero_dp,
    --    positive_dp => positive_dp,
    --    output_dp => output_dp);
    
    
    
     

     
process
begin
 imm_dp <="00000000";
 input_dp <="00000101";
 cntl_word<="00000000000000";
 wait for 100 ns;
 
 cntl_word<="10100000000001";
  wait for 100 ns;
 
end process;
end Behavioral;
