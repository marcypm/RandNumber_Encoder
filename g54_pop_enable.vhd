LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

LIBRARY lpm;
USE lpm.lpm_components.all;


entity g54_pop_enable IS
	port ( 
			N : in std_logic_vector(5 downto 0);
			clk : in std_logic;
			P_EN : out std_logic_vector(51 downto 0)
			);
			
end g54_pop_enable;

ARCHITECTURE lut OF g54_pop_enable IS
BEGIN
crc_table : lpm_rom -- use the altera rom library macrocell
GENERIC MAP(
lpm_widthad => 6, -- sets the width of the ROM address bus
lpm_numwords => 64, -- sets the number of words stored in the ROM
lpm_outdata => "UNREGISTERED", -- no register on the output
lpm_address_control => "REGISTERED", -- register on the input
lpm_file => "P:\DSD Lab\g54_Lab2\g54_pop_enable.mif", -- the ascii file containing the ROM data
lpm_width => 52) -- the width of the word stored in each ROM location
PORT MAP(inclock => clk, address => N, q => P_EN);

END lut;