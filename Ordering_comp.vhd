----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:43 03/23/2025 
-- Design Name: 
-- Module Name:    Ordering_comp - Behavioral 
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

entity Ordering_comp is
    Port ( A,B,C : in  STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in  STD_LOGIC;
           MAX, MID , MIN : out  STD_LOGIC_VECTOR (7 downto 0));
end Ordering_comp;

architecture Behavioral of Ordering_comp is

COMPONENT Eight_ip_dff is
    Port ( rst,clk : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;
 


COMPONENT PE_min_max is
    Port ( rst,clk : in  STD_LOGIC;
           A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           max,min : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;



--process ( rst)
--begin
--
--if (rst ='1') then
--
--MAX <= "00000000";
--MID <= "00000000";
--MIN <= "00000000";
--
--END IF
--
--END PROCESS
signal MAX_1,MIN_1,MAX_2,MIN_2,Q_1,Q_2:  STD_LOGIC_VECTOR (7 downto 0) ; 
begin


u1: PE_min_max port map (rst,clk,A,B,MAX_1,MIN_1);
u2: Eight_ip_dff port map (rst,clk,C,Q_1);

u3 : Eight_ip_dff port map (rst,clk,MAX_1,Q_2);
u4: PE_min_max port map (rst,clk,MIN_1,Q_1,MAX_2,MIN_2);

u5: PE_min_max port map (rst,clk,Q_2,MAX_2,MAX,MID);
u6: Eight_ip_dff port map (rst,clk,MIN_2,MIN);


end Behavioral;

  

