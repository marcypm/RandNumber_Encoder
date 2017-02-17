-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "02/15/2017 16:27:30"
                                                            
-- Vhdl Test Bench template for design  :  g54_pop_enable
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;    
USE ieee.numeric_std.all;                            

ENTITY g54_pop_enable_vhd_tst IS
END g54_pop_enable_vhd_tst;
ARCHITECTURE g54_pop_enable_arch OF g54_pop_enable_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL N : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL P_EN : STD_LOGIC_VECTOR(51 DOWNTO 0);

constant clk_period : time := 20ns;

COMPONENT g54_pop_enable
	PORT (
	clk : IN STD_LOGIC;
	N : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	P_EN : OUT STD_LOGIC_VECTOR(51 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	i1 : g54_pop_enable
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	N => N,
	P_EN => P_EN
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN        
		  clk <= '0';
		  
        for i in 0 to 63 loop
			N <= std_logic_vector(to_unsigned(i,6));
			clk <= '1';
			
			wait for clk_period/2;
			clk <= '0';
			wait for clk_period/2;

			
			end loop;
			 
WAIT;                                                        
END PROCESS always;                                          
END g54_pop_enable_arch;
