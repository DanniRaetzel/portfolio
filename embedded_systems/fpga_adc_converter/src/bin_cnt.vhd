library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bin_cnt is
   generic(N: integer := 4);
   port(
      clk        : in std_logic;
      reset      : in std_logic;
      en         : in std_logic;
      max_tick   : out std_logic;
      d          : out std_logic_vector(N-1 downto 0)
   );
end bin_cnt;

architecture arch of bin_cnt is
   signal r_reg: unsigned(N-1 downto 0);
   signal r_next: unsigned(N-1 downto 0);
begin
   -- update count register
   process(clk,reset)
   begin
      if (reset='1') then
         r_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         r_reg <= r_next;
      end if;
   end process;
   
   -- next-state logic
   r_next <= r_reg + 1 when en = '1' else r_reg;
   
   -- output logic
   d <= std_logic_vector(r_reg);

   max_tick <= '1' when r_reg=(2**N-1) else '0';
end arch;
