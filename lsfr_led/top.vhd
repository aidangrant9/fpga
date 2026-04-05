library ieee;
use ieee.std_logic_1164.all;

entity lsfr_led is
    port(
        i_clk : in std_logic;
        i_switch_1 : in std_logic;
        i_switch_2 : in std_logic;
        o_led_1 : out std_logic;
        o_led_2 : out std_logic;
        o_led_3 : out std_logic;
        o_led_4 : out std_logic
    );
end entity lsfr_led;

architecture RTL of lsfr_led is
    signal w_lsfr_done : std_logic;
    signal w_led_toggle : std_logic := '0';
begin
    inst_lsfr : entity work.lsfr_22
        port map (
            i_clk => i_clk,
            o_lsfr_data => open, 
            o_lsfr_done => w_lsfr_done
        );

    process (i_clk) is
    begin
        if rising_edge(i_clk) then
            if w_lsfr_done = '1' then
                w_led_toggle <= not w_led_toggle;
            end if;
        end if;
    end process;

    inst_demux_1_4 : entity work.demux_1_4
        port map (
            i_data => w_led_toggle,
            i_sel_1 => i_switch_1,
            i_sel_2 => i_switch_2,
            o_data_1 => o_led_1,
            o_data_2 => o_led_2,
            o_data_3 => o_led_3,
            o_data_4 => o_led_4
        );
end architecture RTL;