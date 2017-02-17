-- this circuit implements the IBM RANDU version of a linear congruential generator --
-- entity name: g54_RANDU
--
-- Copyright (C) 2017 Eva Suska, Marcel Morin
-- Version 1.0
-- Author: Marcel Morin, Eva Suska; marcel.morin@mail.mcgill.ca, eva.suska@mail.mcgill.ca -- Date: Feburary 8 2017
library ieee; -- allows use of the std_logic_vector type use ieee.std_logic_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;
USE ieee.std_logic_1164.all; 

entity g54_RANDU is
	port(
		seed : in std_logic_vector(31 downto 0);
		rand : out std_logic_vector(31 downto 0)
	);
end g54_RANDU;

architecture arch1 of g54_RANDU is

	COMPONENT add31
	PORT(
		dataa		: IN STD_LOGIC_VECTOR (30 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (30 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (30 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT add16
	PORT(
		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END COMPONENT;

	SIGNAL	SUM1 :  STD_LOGIC_VECTOR(30 downto 0); --Result of first adder (SEED + SEED shifted once)
	SIGNAL	SUM2 :  STD_LOGIC_VECTOR(15 downto 0);	--Result of SUM1 added with SEED shifted 16 to the left

BEGIN
	

	adder31_inst : add31
		PORT MAP(
			dataa (30 DOWNTO 0) => seed (31 DOWNTO 1), -- OG seed
			datab (30 DOWNTO 0) => seed (30 DOWNTO 0), --seed shifted by 1
			result => SUM1);
			
	adder16_inst : add16
		PORT MAP(
			dataa (15 DOWNTO 0) => SUM1 (30 DOWNTO 15), -- last 16 bits of SUM1
			datab (15 DOWNTO 0) => seed (15 DOWNTO 0), -- seed shifted 16 to the left
			result => SUM2);
			
			
	rand(0) <= seed(0);
	rand (15 downto 1) <= SUM1 (14 downto 0);
	rand (31 downto 16) <= SUM2 (15 downto 0);
	
end arch1;