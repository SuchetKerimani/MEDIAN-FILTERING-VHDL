----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:40 03/25/2025 
-- Design Name: 
-- Module Name:    memory_design - Behavioral 
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

entity memory_design is
    Port ( rst,clk : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end memory_design;

architecture Behavioral of memory_design is

type ram is array (0 to 252) of STD_LOGIC_VECTOR (7 downto 0);

begin
process (clk,rst,d)
variable reg:ram;
begin

 if (rst = '1') then
 q <= "00000000";
 else
 if ( clk'event and clk ='1') then
 q <= reg (252);
 else
 reg ( 1 to 252) :=  reg (0 to 251);
 reg(0):= d;
end if;
end if;
--end variable;
end process;




end Behavioral;

