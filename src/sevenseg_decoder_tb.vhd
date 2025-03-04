----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2025 10:25:25 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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
use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
--  Port ( );
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    component sevenseg_decoder is
    port(
    i_Hex   : in std_logic_vector(3 downto 0);
    o_seg_n: out std_logic_vector(6 downto 0)
    );
    end component;
    
    signal w_Hex    : std_logic_vector(3 downto 0)  :=(others => '0');
    signal w_seg_n  : std_logic_vector(6 downto 0);
    
begin
    my_decoder_inst: sevenseg_decoder port map(
        i_Hex   => w_Hex,
        o_seg_n => w_seg_n
        );
        
        
   test_process : process
   begin
    w_Hex <= x"0"; wait for 10ns;
    assert (w_seg_n = "1000000") report "Error with 0" severity failure;

    w_Hex <= x"1"; wait for 10ns;
    assert (w_seg_n = "1111001") report "Error with 1" severity failure;
    
    w_Hex <= x"E"; wait for 10ns;
    assert (w_seg_n = "0000110") report "Error with E" severity failure;
    
    w_Hex <= x"F"; wait for 10ns;
    assert (w_seg_n = "0001110") report "Error with F" severity failure;
    
    wait;
    end process;
    
end Behavioral;

