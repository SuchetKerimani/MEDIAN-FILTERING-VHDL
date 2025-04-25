----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:43 03/26/2025 
-- Design Name: 
-- Module Name:    top_memory_design - Behavioral 
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

entity top_memory_design is
    Port ( rst,clk : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           out1 : out  STD_LOGIC_VECTOR (7 downto 0));
end top_memory_design;  


architecture Behavioral of top_memory_design is


COMPONENT Eight_ip_dff
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         d : IN  std_logic_vector(7 downto 0);
         q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT memory_design
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         d : IN  std_logic_vector(7 downto 0);
         q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s10:  STD_LOGIC_VECTOR (7 downto 0) ;

begin
 
 u1: Eight_ip_dff port map (rst,clk,D,s1);
 u2: Eight_ip_dff port map (rst,clk,s1,s2);
 u3: Eight_ip_dff port map (rst,clk,s2,s3);
 
 
 u4: memory_design port map (rst,clk,s3,s4);
 
 
 u5: Eight_ip_dff port map (rst,clk,s4,s5);
 u6: Eight_ip_dff port map (rst,clk,s5,s6);
 u7: Eight_ip_dff port map (rst,clk,s6,s7);
 
 u8: memory_design port map (rst,clk,s7,s8);
 
 u9: Eight_ip_dff port map (rst,clk,s8,s9);
 u10: Eight_ip_dff port map (rst,clk,s9,s10);
 u11: Eight_ip_dff port map (rst,clk,s10,out1);
 
end Behavioral;

