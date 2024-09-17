library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RotatingWord is
    Port (
        clk       : in  STD_LOGIC;   -- Clock de 50 MHz
        rst       : in  STD_LOGIC;   -- Botao de reset que colocamos no KEY0
        HEX2      : out STD_LOGIC_VECTOR(6 downto 0); -- Saída p HEX2
        HEX1      : out STD_LOGIC_VECTOR(6 downto 0); -- Saída p HEX1
        HEX0      : out STD_LOGIC_VECTOR(6 downto 0)  -- Saída p HEX0
    );
end RotatingWord;

architecture Behavioral of RotatingWord is

    -- Contador de 26 bits para criar intervalo de 1 segundo (50 MHz)
    signal count_26bit : STD_LOGIC_VECTOR(25 downto 0) := (others => '0');
    
    -- Contador de 2 bits para controlar a rotação dos caracteres
    signal rotation_counter : STD_LOGIC_VECTOR(1 downto 0) := "00";
    
    -- Sinal de habilitação para o contador de rotação
    signal enable_rotation : STD_LOGIC := '0';
    
    -- Função de decodificação de caracteres para 7 segmentos
    function char_to_7seg(c : STD_LOGIC_VECTOR(1 downto 0)) return STD_LOGIC_VECTOR is
    begin
        case c is
            when "00" => return "0100001";  -- 'd'
            when "01" => return "0000110";  -- 'E'
            when "10" => return "1000000";  -- '0'
            when others => return "1111111"; -- Display apagado
        end case;
    end function;

begin

    -- O mesmo que foi feito na parte 3 pra fazer um slowcounter
    process (clk, rst)
    begin
        if rst = '0' then
            count_26bit <= (others => '0');
            enable_rotation <= '0';
        elsif rising_edge(clk) then
            if count_26bit = "10111110101111000010000000" then  -- 50 milhões em binario, pra dar 1 segundo mais ou menos
                count_26bit <= (others => '0');
                enable_rotation <= '1';  -- booleano q habilita a rotação
            else
                count_26bit <= count_26bit + 1;
                enable_rotation <= '0';
            end if;
        end if;
    end process;

    -- Processo para controlar a rotação dos caracteres
    process (clk, rst)
    begin
        if rst = '0' then
            rotation_counter <= "00";
        elsif rising_edge(clk) then
            if enable_rotation = '1' then
                -- Logica para contar somente até 3
                if rotation_counter = "10" then
                    rotation_counter <= "00";
                else
                    rotation_counter <= rotation_counter + 1;
                end if;
            end if;
        end if;
    end process;

    -- Multiplexação dos caracteres nos displays com rotação
    process (rotation_counter)
    begin
        case rotation_counter is
            when "00" =>
                HEX2 <= char_to_7seg("00"); -- 'd'
                HEX1 <= char_to_7seg("01"); -- 'E'
                HEX0 <= char_to_7seg("10"); -- '0'
            when "01" =>
                HEX2 <= char_to_7seg("01"); -- 'E'
                HEX1 <= char_to_7seg("10"); -- '0'
                HEX0 <= char_to_7seg("00"); -- 'd'
            when "10" =>
                HEX2 <= char_to_7seg("10"); -- '0'
                HEX1 <= char_to_7seg("00"); -- 'd'
                HEX0 <= char_to_7seg("01"); -- 'E'
            when others =>	-- Apaga o display nesses casos, embora seja esperado que isso nao aconteça
                HEX2 <= "1111111";  
                HEX1 <= "1111111";  
                HEX0 <= "1111111";  
        end case;
    end process;

end Behavioral;
