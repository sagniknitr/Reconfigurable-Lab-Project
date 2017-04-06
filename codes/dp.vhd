----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2017 00:34:05
-- Design Name: 
-- Module Name: dp - Behavioral
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

entity dp is Port ( 
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
end dp;

architecture Behavioral of dp is

         COMPONENT mux41 PORT( 
          S : IN std_logic_vector(1 DOWNTO 0);
          D3,D2,D1,D0 : IN std_logic_vector(7 DOWNTO 0);
           Y : OUT std_logic_vector(7 DOWNTO 0));
          END COMPONENT;
 
          COMPONENT alu PORT( 
            alusel : in STD_LOGIC_VECTOR (2 downto 0);
            A,B : in STD_LOGIC_VECTOR (7 downto 0);
            F : out STD_LOGIC_VECTOR (7 downto 0));
           END COMPONENT; 
        
            COMPONENT shifter PORT( 
                   shsel : in STD_LOGIC_VECTOR (1 downto 0);
                   A : in STD_LOGIC_VECTOR (7 downto 0);
                   F : out STD_LOGIC_VECTOR (7 downto 0));
             END COMPONENT;
             
             COMPONENT tristatebuff PORT( 
                      E : in STD_LOGIC;
                      D : in STD_LOGIC_VECTOR (7 downto 0);
                      Y : out STD_LOGIC_VECTOR (7 downto 0));           
                END COMPONENT;
                
                COMPONENT acc PORT( 
                           clk_1 : in STD_LOGIC;
                           rst : in STD_LOGIC;
                           wr : in STD_LOGIC; 
                           input : in STD_LOGIC_VECTOR (7 downto 0);
                           output_1 : out STD_LOGIC_VECTOR (7 downto 0));           
                           END COMPONENT;
                           
                  COMPONENT reg_file PORT(
                                      clk_2 : in STD_LOGIC;
                                      wr : in STD_LOGIC;  
                                      addr : in STD_LOGIC_VECTOR (2 downto 0);
                                      in_rf : in STD_LOGIC_VECTOR (7 downto 0);
                                      out_rf : out STD_LOGIC_VECTOR (7 downto 0));
                               END COMPONENT;         
                
                SIGNAL C_aluout,C_accout,C_rfout,C_muxout,C_shiftout : std_logic_vector(7 DOWNTO 0);
                SIGNAL C_outen:std_logic;
             
begin

    U0 : mux41 PORT MAP(muxsel_dp,imm_dp,input_dp,C_rfout,C_shiftout,C_muxout);
    U1 : acc PORT MAP(clk_dp,rst_dp,accwr_dp,C_muxout,C_accout); 
    U2 : reg_file PORT MAP(clk_dp,rfwr_dp,rfaddr_dp,C_accout,C_rfout);
     U3 : alu PORT MAP(alusel_dp,C_accout,C_rfout,C_aluout); 
     U4 : shifter PORT MAP(shiftsel_dp,C_aluout,C_shiftout);
     C_outen<=outen_dp OR rst_dp;
    --U5 : tristatebuff PORT MAP(C_outen,C_accout,output_dp);
     output_dp<= C_accout; 
       -- zero_dp <= '1' WHEN(C_muxout="00000000")ELSE '0';
    --positive_dp <= NOT C_muxout(7);
    --positive_dp<='1'WHEN(C_muxout(7)='0') ELSE '0';
end Behavioral;

