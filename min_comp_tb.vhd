--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:58 03/23/2025
-- Design Name:   
-- Module Name:   C:/pro/ieee/min_comp_tb.vhd
-- Project Name:  ieee
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: min_comp
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
 
ENTITY min_comp_tb IS
END min_comp_tb;
 
ARCHITECTURE behavior OF min_comp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT min_comp
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         C : IN  std_logic_vector(7 downto 0);
         MIN : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal C : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MIN : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: min_comp PORT MAP (
          rst => rst,
          clk => clk,
          A => A,
          B => B,
          C => C,
          MIN => MIN
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
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clk_period*10;

      -- insert stimulus here 
rst <= '1' after 10 ns, '0' after 20 ns;
A<= "00000001" after 20 ns,"10000001"after 30 ns,"10000000" after 40 ns,"01000000" after 50 ns,"01001000" after 60 ns;

B<= "10000000" after 20 ns,"10000001" after 30 ns,"01000000" after 40 ns,"00000000" after 50 ns,"01000010" after 60 ns;


C<= "01000000" after 20 ns,"10000001" after 30 ns,"00000000" after 40 ns,"10000000" after 50 ns,"01000001" after 60 ns;
      wait;
   end process;

END;
