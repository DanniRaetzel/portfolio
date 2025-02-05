library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity scaling_unit is
    Port (
        scale_in  : in STD_LOGIC_VECTOR(7 downto 0);
        bcd3      : out std_logic_vector(3 downto 0);  -- Most Significant Digit
        bcd2      : out std_logic_vector(3 downto 0);
        bcd1      : out std_logic_vector(3 downto 0);
        bcd0      : out std_logic_vector(3 downto 0)   -- Least Significant Digit
    );
end scaling_unit;

architecture Behavioral of scaling_unit is
  signal bin_int : integer := 0;
begin
  process(scale_in)
  begin
    bin_int <= to_integer((unsigned(scale_in) * 13)); -- multiply by 13mV/bit
        
    -- Extract BCD digits
    bcd3 <= std_logic_vector(to_unsigned((bin_int / 1000) mod 10, 4));
    bcd2 <= std_logic_vector(to_unsigned((bin_int / 100) mod 10, 4));
    bcd1 <= std_logic_vector(to_unsigned((bin_int / 10) mod 10, 4));
    bcd0 <= std_logic_vector(to_unsigned(bin_int mod 10, 4));
  end process;
end Behavioral;
