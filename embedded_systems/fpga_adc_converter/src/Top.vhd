library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Top is
    Port (
        clock       : in  std_logic;                     -- clock
        rst         : in  std_logic;                     -- reset
        conv_start  : in  std_logic;                     -- adc conversion start button
        toggle_ch   : in  std_logic;                     -- adc channel button toggle
        adc_channel : in  std_logic_vector(1 downto 0);  -- answer bits from the R2R comparators
        ready_LED   : out std_logic;                     -- Ready for new conversion.
        busy_LED    : out std_logic;                     -- Busy with conversion
        channel_LED : out std_logic_vector(1 downto 0);  -- adc channel selector indicator.
        seven_seg   : out std_logic_vector(7 downto 0);  -- bits for seven segments
        disp_cc     : out std_logic_vector(3 downto 0);  -- selector for the 4 displays common cathode
        r2r_ctrl    : out std_logic_vector(7 downto 0)   -- control bits for the R2R resistor network.
    );
end Top;

architecture Behavioral of Top is
    signal adc_enable    : std_logic;                     -- prescaler to ADC enable signal
    signal ch_debounced  : std_logic;                     -- ch select button debounce to counter.
    signal start_debounced : std_logic;                   -- start button debounce to counter.
    signal conversion_busy : std_logic;                   -- busy out from adc.
    signal mux_counter   : std_logic_vector(1 downto 0);  -- counter to mux
    signal start_counter : std_logic_vector(1 downto 0);  -- counter to adc start
    signal adc_mux_out   : std_logic;                     -- mux to adc
    signal adc_result    : std_logic_vector(7 downto 0);  -- adc to scaleto_mv_BCD
    signal bcd_digit0, bcd_digit1, bcd_digit2, bcd_digit3  : std_logic_vector(3 downto 0); -- scaleto_mV_BCD output to display input
begin

    -- instantiate adc enable prescaler.
    prescaler : entity work.bin_cnt
        generic map(N => 20)            -- calculated as: 100MHz/2^(20)=95.37Hz
        port map(
            clk        => clock,        -- system clock input (100 MHz)
            reset      => rst,          -- reset input
            en         => '1',          -- Enable set to 1 (counter always on)
            max_tick   => adc_enable,   -- max_tick signal out (pulse freq. 95.37 Hz)
            d          => OPEN);        -- Binary counter output value not used therefore OPEN.

    -- instantiate debounce on start button
    debounce_start : entity work.debounce
        port map(
            clk      => clock,          -- system clock input (100 MHz) 
            reset    => rst,            -- reset input
            sw       => conv_start,     -- start button input
            db_level => OPEN,           -- level output not used
            db_tick  => start_debounced);-- debounced output pulse

    -- instantiate start toggle.
    toggle_start : entity work.bin_cnt
        generic map(N => 2)            -- configure for 2 bit
        port map(
            clk        => clock,        -- system clock input (100 MHz)
            reset      => conversion_busy, -- reset input
            en         => start_debounced, -- Enable input (from debounce)
            max_tick   => OPEN,         -- max_tick output not used therefore OPEN
            d          => start_counter);-- binary output from counter

    -- instantiate debounce on channel select button
    debounce_channel : entity work.debounce
        port map(
            clk      => clock,          -- system clock input (100 MHz) 
            reset    => rst,            -- reset input
            sw       => toggle_ch,      -- channel toggle button input
            db_level => OPEN,           -- level output not used
            db_tick  => ch_debounced);  -- debounced output pulse

    -- instantiate counter channel mux toggle.
    toggle_channel : entity work.bin_cnt
        generic map(N => 2)             -- configure for 2 bit
        port map(
            clk        => clock,        -- system clock input (100 MHz)
            reset      => rst,          -- reset input
            en         => ch_debounced, -- Enable input (from debounce)
            max_tick   => OPEN,         -- max_tick output not used therefore OPEN
            d          => mux_counter); -- binary output from counter

    -- Processing buffer state bits to one hex value to present on 7 segment.
    process(mux_counter, adc_channel)
    begin
        if (mux_counter(0) = '0') then              
            adc_mux_out <= adc_channel(0);
        else
            adc_mux_out <= adc_channel(1);               
        end if;
    end process;

    -- LED indicator output update.
    channel_LED(0) <= mux_counter(0);                        
    channel_LED(1) <= not mux_counter(0); 
    busy_LED  <= conversion_busy;                   

    -- instantiate ADC
    adc_instance : entity work.counting_ADC
        port map(
            clk        => clock,           -- system clock input (100 MHz)
            reset      => rst,             -- reset input
            en         => adc_enable,      -- ADC enable signal from prescaler to slow down FSMD (settling time for opamp)
            start      => start_counter(0),-- debounced toggle button Start conversion signal.
            comp       => adc_mux_out,     -- muxed r2r response signal.
            ready      => ready_LED,       -- Ready signal out.
            busy       => conversion_busy, -- Busy signal out (resets start signal)
            r2r        => r2r_ctrl,        -- output to r2r resistor network.
            value      => adc_result);     -- conversion result value (unscaled)

    -- instantiate ScaleTo_mV_BCD
    scaling_instance : entity work.scaling_unit
        Port map (
            scale_in  => adc_result,       -- unscaled adc result in is scaled and converted to 4 x 4 bit BCD
            bcd3 => bcd_digit3,            -- MSB
            bcd2 => bcd_digit2,
            bcd1 => bcd_digit1,
            bcd0 => bcd_digit0);           -- LSB

    -- instantiate hex to 7-segment decoder module 
    display_module : entity work.disp_mux
        port map(
            clk   => clock,                -- system clock input (100 MHz)
            reset => rst,                  -- reset input
            hex3  => bcd_digit3,           -- 7 segm. no.3
            hex2  => bcd_digit2,
            hex1  => bcd_digit1,
            hex0  => bcd_digit0,
            dp_in => "1000",               -- decimal point off
            sseg  => seven_seg,            -- output to 7 segment   
            cc(3) => disp_cc(3),           -- Segment 3 select signal
            cc(2) => disp_cc(2),           -- Segment 2 select signal
            cc(1) => disp_cc(1),           -- Segment 1 select signal
            cc(0) => disp_cc(0));          -- Segment 0 select signal

end Behavioral;
