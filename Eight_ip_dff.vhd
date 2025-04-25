----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:51:25 03/23/2025 
-- Design Name: 
-- Module Name:    Eight_ip_dff - Behavioral 
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
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Eight_ip_dff is
    Port ( rst,clk : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end Eight_ip_dff;

architecture Behavioral of Eight_ip_dff is

begin

process (rst,clk)


begin
if (rst = '1') then
 q <= "00000000";
 elsif (clk' event and clk = '1') then
 q<=d;
 end if;
 end process;

end Behavioral;

