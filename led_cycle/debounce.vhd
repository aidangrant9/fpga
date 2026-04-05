library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debounce_filter is
    generic (DEBOUNCE_LIMIT : integer := 20);
    port(
        i_clk : in std_logic;
        i_bouncy : in std_logic;
        o_debounced : out std_logic
    );
end entity debounce_filter;

architecture RTL of debounce_filter is
    signal r_count : integer range 0 to DEBOUNCE_LIMIT := 0;
    signal r_state : std_logic := '0';
begin

process (i_clk) is
begin
    if rising_edge(i_clk) then
        if (i_bouncy /= r_state and r_Count < DEBOUNCE_LIMIT-1) then
            r_count <= r_count + 1;
        elsif r_count = DEBOUNCE_LIMIT-1 then
            r_state <= i_bouncy;
            r_count <= 0;
        else
            r_count <= 0;
        end if;
    end if;

end process;

o_debounced <= r_state;

end architecture RTL;