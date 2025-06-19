library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink is
    port(
    i_clock : in std_logic;
    o_led : out std_logic;
    );
end blink;

architecture rtl of blink is
    -- 27MHZ clock
    constant c_clock_stride : natural := 6750000;
    signal clock_count : natural range 0 to c_clock_stride := 0;
begin
    count : process (i_clock, o_led, clock_count)
    begin
        if rising_edge(i_clock) then
            if (clock_count = c_clock_stride) then
                clock_count <= 0;
                o_led <= not o_led;
            else
                clock_count <= clock_count + 1;
            end if;
        end if;
    end process count;
end rtl;
