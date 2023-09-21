library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity Ten_bit_binary_to_3_digit_7_seg is
	Port (clock  	: in  std_logic;										-- system clock
			reset  	: in  std_logic; 										-- synchronous reset, active-high
			data_i 	: in  STD_LOGIC_VECTOR (9 downto 0);
			seven_seg_digit_1 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_2 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_3 : out STD_LOGIC_VECTOR (6 downto 0) );
end Ten_bit_binary_to_3_digit_7_seg;

architecture converter of Ten_bit_binary_to_3_digit_7_seg is
signal BCD_data_digit_1 : STD_LOGIC_VECTOR (3 downto 0);
signal BCD_data_digit_2 : STD_LOGIC_VECTOR (3 downto 0);
signal BCD_data_digit_3 : STD_LOGIC_VECTOR (3 downto 0);
	begin
		convert_binary:			entity work.BCD_3_digit_7_seg_display(Behavioral)
									port map( 		-- Port inputs
										clk_i 		=> clock,
										rst_i 		=> reset,
										data  		=> data_i,
										BCD_digit_1 => BCD_data_digit_1,
										BCD_digit_2 => BCD_data_digit_2,
										BCD_digit_3 => BCD_data_digit_3);
		seven_seg_display_1: 	entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i 		=> clock,
										BCD_i  		=> BCD_data_digit_1,
										seven_seg  	=> seven_seg_digit_1 );
		seven_seg_display_2: 	entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i 		=> clock,
										BCD_i  		=> BCD_data_digit_2,
										seven_seg  	=> seven_seg_digit_2 );
		seven_seg_display_3: 	entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i 		=> clock,
										BCD_i  		=> BCD_data_digit_3,
										seven_seg  	=> seven_seg_digit_3 );
end converter;