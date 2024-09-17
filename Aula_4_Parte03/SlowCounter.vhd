--codigo de um slow counter com decoder para BCD
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SlowCounter is
    Port (
        clk       : in  STD_LOGIC;   -- Clock de 50 MHz
        rst       : in  STD_LOGIC;   -- Reset
        seg_out   : out STD_LOGIC_VECTOR(6 downto 0)  -- Saída para os 7 segmentos (a, b, c, d, e, f, g)
    );
end SlowCounter;

architecture Behavioral of SlowCounter is

    -- Sinal para o contador de 26 bits
    signal count_26bit : STD_LOGIC_VECTOR (25 downto 0) := (others => '0');
    
    -- Sinal de habilitação para o contador lento
    signal enable_slow_count : STD_LOGIC := '0';
    
    -- Contador lento para exibir os dígitos de 0 a 9
    signal slow_count : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin

    -- Processo do contador de 26 bits
    process (clk, rst)
    begin
        if rst = '0' then
            count_26bit <= (others => '0');
            enable_slow_count <= '0';
        elsif rising_edge(clk) then
            if count_26bit = "10111110101111000010000000" then  -- Aproximadamente 50 milhões (1 segundo com clock de 50 MHz)
                count_26bit <= (others => '0');
                enable_slow_count <= '1';  -- Habilita o contador lento
            else
                count_26bit <= count_26bit + 1;
                enable_slow_count <= '0';
            end if;
        end if;
    end process;

    -- Processo do contador lento (Flip-Flop T)
    process (clk, rst)
    begin
        if rst = '0' then
            slow_count <= (others => '0');
        elsif rising_edge(clk) then
            if enable_slow_count = '1' then
                if slow_count = "1001" then  -- Se chegar a 9, volta para 0
                    slow_count <= (others => '0');
                else
                    slow_count <= slow_count + 1;
                end if;
            end if;
        end if;
    end process;

    -- Decodificador BCD para 7 segmentos
	 -- 0 para ligado e 1 para desligado
    process (slow_count)
    begin
        case slow_count is
            when "0000" => seg_out <= "1000000"; -- 0
            when "0001" => seg_out <= "1111001"; -- 1
            when "0010" => seg_out <= "0100100"; -- 2
            when "0011" => seg_out <= "0110000"; -- 3
            when "0100" => seg_out <= "0011001"; -- 4
            when "0101" => seg_out <= "0010010"; -- 5
            when "0110" => seg_out <= "0000010"; -- 6
            when "0111" => seg_out <= "1111000"; -- 7
            when "1000" => seg_out <= "0000000"; -- 8
            when "1001" => seg_out <= "0010000"; -- 9
            when others => seg_out <= "1111111"; -- Display apagado em caso de erro
        end case;
    end process;

end Behavioral;