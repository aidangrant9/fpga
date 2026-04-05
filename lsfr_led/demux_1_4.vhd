library ieee; 
use ieee.std_logic_1164.all;

entity demux_1_4 is
    port(
        i_data : in std_logic;
        i_sel_1 : in std_logic;
        i_sel_2 : in std_logic;
        o_data_1 : out std_logic;
        o_data_2 : out std_logic;
        o_data_3 : out std_logic;
        o_data_4 : out std_logic
    );
end entity demux_1_4;

architecture RTL of demux_1_4 is
begin
    o_data_1 <= i_data when i_sel_1 = '0' and i_sel_2 = '0' else '0';
    o_data_2 <= i_data when i_sel_1 = '1' and i_sel_2 = '0' else '0';
    o_data_3 <= i_data when i_sel_1 = '0' and i_sel_2 = '1' else '0';
    o_data_4 <= i_data when i_sel_1 = '1' and i_sel_2 = '1' else '0';
end architecture RTL;