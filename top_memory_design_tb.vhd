--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:33:18 03/26/2025
-- Design Name:   
-- Module Name:   C:/Pro/ieee/top_memory_design_tb.vhd
-- Project Name:  ieee
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_memory_design
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY top_memory_design_tb IS
END top_memory_design_tb;
 
	ARCHITECTURE behavior OF top_memory_design_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_memory_design
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         d : IN  std_logic_vector(7 downto 0);
         out1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal d : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal out1 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_memory_design PORT MAP (
          rst => rst,
          clk => clk,
          d => d,
          out1 => out1
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clk_period*10;

      -- insert stimulus here 
--rst <= '1' after 10 ns, '0' after 20 ns ;
d <= "11111111" after 0 ns;

      wait;
   end process;

END;
