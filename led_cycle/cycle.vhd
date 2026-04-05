library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_cycle is
    port (
        i_clk : in std_logic;
        i_switch : in std_logic;
        o_led_1 : out std_logic;
        o_led_2 : out std_logic;
        o_led_3 : out std_logic;
        o_led_4 : out std_logic
    );

end entity led_cycle;

architecture RTL of led_cycle is
    signal r_switch : std_logic := '0';
    signal r_count : integer range 0 to 3 := 0;
begin

    process (i_clk) is
    begin  
        if rising_edge(i_clk) then
        r_switch <= i_switch;
            if r_switch = '1' and i_switch = '0' then
                r_count <= r_count + 1;
            end if;
         end if;
    end process;

    o_led_1 <= '1' when r_count = 0 else '0';
    o_led_2 <= '1' when r_count = 1 else '0';
    o_led_3 <= '1' when r_count = 2 else '0';
    o_led_4 <= '1' when r_count = 3 else '0'; 

end architecture RTL;