----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
-- Create Date:    13:19:13 03/23/2025 
-- Design Name: 
-- Module Name:    median_filter - Behavioral 
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

entity median_filter is
    Port ( rst,clk : in  STD_LOGIC;
           A,B,C : in  STD_LOGIC_VECTOR (7 downto 0);
           MIDDLE : out  STD_LOGIC_VECTOR (7 downto 0));
end median_filter;


architecture Behavioral of median_filter is

COMPONENT Eight_ip_3_fifo is
    Port ( rst,clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           out1 : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT Ordering_comp is
    Port ( A,B,C : in  STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in  STD_LOGIC;
           MAX, MID , MIN : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

component Eight_ip_dff is
    Port ( rst,clk : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


component min_comp is
    Port ( rst,clk : in  STD_LOGIC;
           A,B,C : in  STD_LOGIC_VECTOR (7 downto 0);
           MIN : OUT  STD_LOGIC_VECTOR (7 downto 0));
end component;

component median_comp is
    Port ( A,B,C : in  STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in  STD_LOGIC;
           MID : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

COMPONENT max_comp is
    Port ( rst,clk : in  STD_LOGIC;
           A,B,C : in  STD_LOGIC_VECTOR (7 downto 0);
           MAX: OUT  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;


signal OUT_1,OUT_2,OUT_3,MAX_1, MID_1, MIN_1,Q_1,Q_2, MAX_2, MID_2, MIN_2,Q_3,Q_4,Q_5,Q_6:  STD_LOGIC_VECTOR (7 downto 0) ; 


begin


u1: Eight_ip_3_fifo  port map (rst,clk,A,OUT_1);
u2: Eight_ip_3_fifo  port map (rst,clk,B,OUT_2);
u3: Eight_ip_3_fifo  port map (rst,clk,C,OUT_3);


u4:  Ordering_comp  port map (OUT_1,OUT_2,OUT_3,clk,rst,MAX_1, MID_1, MIN_1);



u5: Eight_ip_dff  port map (rst,clk,MAX_1,Q_1);

u6: Eight_ip_dff  port map (rst,clk,Q_1,Q_2);

u7: min_comp  port map (rst,clk,MAX_1,Q_1,Q_2, MIN_2);


u8: Eight_ip_dff  port map (rst,clk,MID_1,Q_3);

u9: Eight_ip_dff  port map (rst,clk,Q_3,Q_4);

u10: median_comp  port map (MID_1,Q_3,Q_4,clk,rst,MID_2);


u11: Eight_ip_dff  port map (rst,clk,MIN_1,Q_5);

u12: Eight_ip_dff  port map (rst,clk,Q_5,Q_6);

u13: min_comp  port map (rst,clk,MIN_1,Q_5,Q_6, MAX_2);



u14: median_comp  port map (MIN_2,MID_2,MAX_2,clk,rst,MIDDLE);


end Behavioral;

