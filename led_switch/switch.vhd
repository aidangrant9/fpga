library ieee;
use ieee.std_logic_1164.all;

entity Switch is
    port (
        i_Clk : in std_logic;
        i_Switch_1 : in std_logic;
        o_LED_1 : out std_logic
    );
end entity Switch;

architecture RTL of Switch is
    signal r_LED_1 : std_logic := '0';
    signal r_Switch_1 : std_logic := '0';
begin
    
process (i_Clk) is
    begin
        if rising_edge(i_Clk) then
            r_Switch_1 <= i_Switch_1;
            if r_Switch_1 = '1' and i_Switch_1 = '0' then
                r_LED_1 <= not r_LED_1;
            end if;
        end if;
    end process;

    o_LED_1 <= r_LED_1;
end architecture RTL;