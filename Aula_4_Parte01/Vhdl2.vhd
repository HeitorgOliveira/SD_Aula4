library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlop_T is
    Port (
        T   : in  STD_LOGIC;  -- Entrada T
        clk : in  STD_LOGIC;  -- Sinal de clock
        rst : in  STD_LOGIC;  -- Sinal de reset
        Q   : out STD_LOGIC   -- Saída Q
    );
end FlipFlop_T;

architecture Behavioral of FlipFlop_T is
    signal Q_int : STD_LOGIC := '0';  -- Sinal interno para a saída Q
begin
    process (clk, rst)
    begin
        if rst = '1' then
            Q_int <= '0';  -- Reset assíncrono, Q é zerado
        elsif rising_edge(clk) then
            if T = '1' then
                Q_int <= not Q_int;  -- Troca o estado quando T = 1
            end if;
        end if;
    end process;

    Q <= Q_int;
end Behavioral;
