----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:21:12 03/23/2025 
-- Design Name: 
-- Module Name:    PE_min_max - Behavioral 
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

entity PE_min is 
    Port ( rst,clk : in  STD_LOGIC;
           A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           min: out  STD_LOGIC_VECTOR (7 downto 0));
end PE_min;

architecture Behavioral of PE_min is

begin

process ( rst,clk )


begin

if (rst = '1') then
--max <= "00000000";
min <= "00000000";
elsif (clk' event and clk = '1') then
 
 if (A > B) then
 --max <= A;
 min <= B;
 
  elsif (B> A) then
 --max <= B;
 min <= A;

elsif (B= A) then
 --max <= A;
 min <= B;
 
 end if;
 
 end if;
 end process;





end Behavioral;

