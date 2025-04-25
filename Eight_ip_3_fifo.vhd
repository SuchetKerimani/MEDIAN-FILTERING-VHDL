----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:14:33 03/23/2025 
-- Design Name: 
-- Module Name:    Eight_ip_3_fifo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Eight_ip_3_fifo is
    Port ( rst,clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           out1 : out  STD_LOGIC_VECTOR (7 downto 0));
end Eight_ip_3_fifo;

architecture Behavioral of Eight_ip_3_fifo is

component Eight_ip_dff is
    Port ( rst,clk : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;



signal q1,q2:  STD_LOGIC_VECTOR (7 downto 0) ;
begin
u1: Eight_ip_dff port map (rst,clk,D,q1);

u2:Eight_ip_dff port map (rst,clk,q1,q2);

u3:Eight_ip_dff port map (rst,clk,q2,out1);

 
end Behavioral;

