library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity BCD_3_digit_7_seg_display is
		Port (clk_i       : in  std_logic;							-- system clock
				rst_i       : in  std_logic; 							-- synchronous reset, active-high
				data 	    : in  STD_LOGIC_VECTOR (9 downto 0); 	-- 10 bit input data
				BCD_digit_1 : out STD_LOGIC_VECTOR (3 downto 0);
				BCD_digit_2 : out STD_LOGIC_VECTOR (3 downto 0);
				BCD_digit_3 : out STD_LOGIC_VECTOR (3 downto 0));
end BCD_3_digit_7_seg_display;

architecture Behavioral of BCD_3_digit_7_seg_display is
signal int_data_1 : integer:= 0;
signal int_data_2 : integer:= 0;
signal int_data_3 : integer:= 0;
signal int_data_4 : integer:= 0;
	begin
		process(clk_i, rst_i)
			begin
				if (rst_i='0') then  
					int_data_1 <= 0;
					int_data_2 <= 0;
					int_data_3 <= 0;
					int_data_4 <= 0;
					
				elsif (clk_i'event and clk_i='1') then  
					int_data_1 <= conv_integer(unsigned(data)) mod 10; -- use conv_integer to convert unsigned to integer
					int_data_2 <= (conv_integer(unsigned(data))/ 10 ) mod 10 ;
					int_data_3 <= (conv_integer(unsigned(data))/ 100 ) mod 10;
					int_data_4 <= (conv_integer(unsigned(data))/ 1000 ) mod 10;
				end if;
				if (int_data_4/=1) then -- if the number is not 1, then display the number (/= means not equal)
					BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4); -- use conv_std_logic_vector to convert integer to std_logic_vector
					BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4); -- std_logic_vector is array
					BCD_digit_3 <= conv_std_logic_vector(int_data_3, 4);
				else -- if the number is 1, then display nothing
					BCD_digit_1 <= "1111";
					BCD_digit_2 <= "1111";
					BCD_digit_3 <= "1111";
				end if;
		end process;
end Behavioral;