-- Listing 4.15
-- updated
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity disp_mux is
    port(
        clk, reset             : in  std_logic;
        hex3, hex2, hex1, hex0 : in  std_logic_vector(3 downto 0);
        dp_in                  : in  std_logic_vector(3 downto 0);
        cc                     : out std_logic_vector(3 downto 0);
        sseg                   : out std_logic_vector(7 downto 0)
    );
end disp_mux;

architecture arch of disp_mux is
    -- refresh rate is (100MHZ/2**17) =  762 Hz (refreshed on q_reg(N-2)
    constant N           : integer := 19;
    signal q_reg, q_next : unsigned(N - 1 downto 0);
    signal sel           : std_logic_vector(1 downto 0);
    signal hex           : std_logic_vector(3 downto 0);
    signal dp            : std_logic;
begin
    -- register
    process(clk, reset)
    begin
        if reset = '1' then
            q_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            q_reg <= q_next;
        end if;
    end process;

    -- next-state logic for the counter
    q_next <= q_reg + 1;

    -- 2 MSBs of counter to control 4-to-1 multiplexing
    sel <= std_logic_vector(q_reg(N - 1 downto N - 2));
    process(sel, hex0, hex1, hex2, hex3, dp_in)
    begin
        case sel is
            when "00" =>
                cc  <= "0001";
                hex <= hex0;
                dp  <= dp_in(0);
            when "01" =>
                cc  <= "0010";
                hex <= hex1;
                dp  <= dp_in(1);
            when "10" =>
                cc  <= "0100";
                hex <= hex2;
                dp  <= dp_in(2);
            when others => 
                cc  <= "1000";
                hex <= hex3;
                dp  <= dp_in(3);
        end case;
    end process;
    
    -- hex-to-7-segment led decoding
    with hex select sseg(6 downto 0) <=
        "1111110" when "0000", -- 0
        "0110000" when "0001", -- 1
        "1101101" when "0010", -- 2
        "1111001" when "0011", -- 3
        "0110011" when "0100", -- 4
        "1011011" when "0101", -- 5
        "1011111" when "0110", -- 6
        "1110000" when "0111", -- 7
        "1111111" when "1000", -- 8
        "1111011" when "1001", -- 9
        "1110111" when "1010", -- a
        "0011111" when "1011", -- b
        "1001110" when "1100", -- c
        "0111101" when "1101", -- d
        "1001111" when "1110", -- e
        "1000111" when others; -- f
    -- decimal point
    sseg(7) <= dp;
    
end arch;
