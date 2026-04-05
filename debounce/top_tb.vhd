library ieee;
use ieee.std_logic_1164.all;

entity debounce_filter_tb is
end entity debounce_filter_tb;

architecture test of debounce_filter_tb is
    signal r_clk, r_bouncy, w_debounced : std_logic := '0';
begin
    r_clk <= not r_clk after 2 ns;

    UUT : entity work.debounce_filter
        generic map (DEBOUNCE_LIMIT => 4)
        port map (
            i_clk => r_clk,
            i_bouncy => r_bouncy,
            o_debounced => w_debounced
        );

process is
begin
    wait for 10 ns;
    r_bouncy <= '1';

    wait until rising_edge(r_clk);
    r_bouncy <= '0';

    wait until rising_edge(r_clk);
    r_bouncy <= '1';

    wait for 24 ns;
    wait;
end process;
end architecture test;