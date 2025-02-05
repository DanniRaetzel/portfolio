library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity counting_ADC is
    Port (
        clk :     in std_logic;                       -- system clock input (100 MHz)
        reset :   in std_logic;                       -- reset input
        en :      in std_logic;                       -- enable signal to slow down FSMD due to settling time for opamp
        start :   in std_logic;                       -- start conversion signal
        comp :    in std_logic;                       -- comparation input signal (from r2r)
        ready :   out std_logic;                      -- ready for conversion indicator
        busy :    out std_logic;                      -- adc busy output
        r2r :     out std_logic_vector(7 downto 0);   -- output to r2r resistor network
        value :   out std_logic_vector(7 downto 0)    -- conversion result value output (unscaled)
    );
end counting_ADC;

architecture Behavioral of counting_ADC is
    type state_type is (S_IDLE, S_COUNT, S_DONE); -- States in FSMD
    signal state_reg, state_next : state_type;
    signal counter : std_logic_vector(7 downto 0);        -- 8-bit counter
    signal counter_next : std_logic_vector(7 downto 0);
begin
    -- Sequential state assignment
    process (clk, reset)
    begin
        if (reset = '1') then
            state_reg <= S_IDLE;
            counter <= (others => '0');
        elsif rising_edge(clk) then
            if (en = '1') then            -- state and so on only shifted when en is true, to slow down state machine.
                state_reg <= state_next;  -- data-path for state variable
                counter <= counter_next;  -- data-path for counter
            end if;
        end if;
    end process;
    -- Next state logic with Moore and Mealy output logic
    process(state_reg, start, comp, counter)
    begin
        -- Default
        state_next <= state_reg;
        counter_next <= counter;
        r2r <= (counter);
        value <= (counter);
        -- Finite State Machine with Data path
        case state_reg is
            when S_IDLE =>
                ready <= '1';                     -- Ready to start
                busy <= '0';
                if start = '1' then               -- Waiting for Start command
                    state_next <= S_COUNT;        -- Next state 
                    counter_next <= (others => '0'); -- Reset counter
                end if;
            when S_COUNT =>
                ready <= '0';
                busy <= '1';                      -- Busy
                if comp = '0' then                -- Check compare input
                    state_next <= S_DONE;         -- Conversion done if comparator output is high
                else
                    counter_next <= std_logic_vector(unsigned(counter) + 1);  -- Increment counter
                end if;
            when S_DONE =>
                ready <= '1';                     -- Ready again
                busy <= '0';
                state_next <= S_IDLE;             -- Go to first state again
        end case;
    end process;
end Behavioral;
