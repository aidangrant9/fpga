library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lsfr_22 is
    port(
        i_clk : in std_logic;
        o_lsfr_data : out std_logic_vector(21 downto 0);
        o_lsfr_done : out std_logic
    );
end entity lsfr_22;

architecture RTL of lsfr_22 is
    signal r_lsfr : std_logic_vector(21 downto 0);
    signal w_xnor : std_logic;
begin
    w_xnor <= r_lsfr(20) xnor r_lsfr(21);

    process (i_clk) is
    begin
        if rising_edge(i_clk) then
            r_lsfr <= r_lsfr(20 downto 0) & w_xnor;
        end if;
    end process;

    o_lsfr_done <= '1' when unsigned(r_lsfr) = 0 else '0';
    o_lsfr_data <= r_lsfr;
end architecture RTL;