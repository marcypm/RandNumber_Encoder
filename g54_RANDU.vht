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
-- Generated on "02/12/2017 21:08:45"
                                                            
-- Vhdl Test Bench template for design  :  g54_RANDU
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g54_RANDU_vhd_tst IS
END g54_RANDU_vhd_tst;
ARCHITECTURE g54_RANDU_arch OF g54_RANDU_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL rand : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL seed : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT g54_RANDU
	PORT (
	rand : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	seed : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g54_RANDU
	PORT MAP (
-- list connections between master ports and signals
	rand => rand,
	seed => seed
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
		seed <= "00000000000000000000000000000001";
		WAIT FOR 10 ns;

		for i in 0 to 4 loop
			WAIT FOR 10 ns;
			seed <= rand;
		end loop;
			
WAIT;                                                        
END PROCESS always;                                          
END g54_RANDU_arch;
