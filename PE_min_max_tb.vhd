--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:41:25 03/23/2025
-- Design Name:   
-- Module Name:   C:/pro/ieee/PE_min_max_tb.vhd
-- Project Name:  ieee
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PE_min_max
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
 
ENTITY PE_min_max_tb IS
END PE_min_max_tb;
 
ARCHITECTURE behavior OF PE_min_max_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PE_min_max
    PORT(
         clk : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         min : OUT  std_logic_vector(7 downto 0);
         max : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal min : std_logic_vector(7 downto 0);
   signal max : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PE_min_max PORT MAP (
          clk => clk,
          A => A,
          B => B,
          min => min,
          max => max
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
		
		A <= "10101010" after 10 ns;
		B <= "10101010" after 10 ns;

      wait;
   end process;

END;
