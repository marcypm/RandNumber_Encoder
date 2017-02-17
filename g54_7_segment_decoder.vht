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
-- Generated on "02/15/2017 18:13:37"
                                                            
-- Vhdl Test Bench template for design  :  g54_7_segment_decoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;    
USE ieee.numeric_std.all;                            

ENTITY g54_7_segment_decoder_vhd_tst IS
END g54_7_segment_decoder_vhd_tst;
ARCHITECTURE g54_7_segment_decoder_arch OF g54_7_segment_decoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL mode : STD_LOGIC;
SIGNAL segments_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT g54_7_segment_decoder
	PORT (
	code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	mode : IN STD_LOGIC;
	segments_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g54_7_segment_decoder
	PORT MAP (
-- list connections between master ports and signals
	code => code,
	mode => mode,
	segments_out => segments_out
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
        
	FOR Kmode in std_logic range '0' to '1' LOOP
      mode <= Kmode;                                        
        FOR i IN 0 to 15 LOOP
          code <= std_logic_vector(to_unsigned(i,4));
          wait for 10ns;
    END LOOP;
  END LOOP;
		  
		  -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END g54_7_segment_decoder_arch;
