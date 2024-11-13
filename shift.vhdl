library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRegister is
    Port (
        clk: in STD_LOGIC;
        reset: in STD_LOGIC;
        shift: in STD_LOGIC;
        data_in: in STD_LOGIC_VECTOR(3 downto 0);
        data_out: out STD_LOGIC_VECTOR(3 downto 0)
    );
end ShiftRegister;

architecture Behavioral of ShiftRegister is
    signal register_data: STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal next_register_data: STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            register_data <= "0000";
        elsif rising_edge(clk) then
            if shift = '0' then
                next_register_data(3) <= register_data(2);
                next_register_data(2) <= register_data(1);
                next_register_data(1) <= register_data(0);
                next_register_data(0) <= data_in(0);
            elsif shift = '1' then
                next_register_data(0) <= register_data(1);
                next_register_data(1) <= register_data(2);
                next_register_data(2) <= register_data(3);
                next_register_data(3) <= data_in(3);
            end if;
            register_data <= next_register_data;
        end if;
    end process;

    data_out <= register_data;
end Behavioral;
