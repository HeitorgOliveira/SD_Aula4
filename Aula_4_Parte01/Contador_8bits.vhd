library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entidade do contador síncrono de 8 bits
entity Contador_8bits is
    Port (
        clk : in  STD_LOGIC;  -- Sinal de clock
        rst : in  STD_LOGIC;  -- Sinal de reset
		  enable: in STD_LOGIC;
		  HEX0   : out STD_LOGIC_VECTOR(6 downto 0);  -- Saída para os 7 segmentos (a, b, c, d, e, f, g)
		  HEX1   : out STD_LOGIC_VECTOR(6 downto 0)  -- Saída para os 7 segmentos (a, b, c, d, e, f, g)
    );
end Contador_8bits;

architecture Behavioral of Contador_8bits is
    -- Sinais intermediários para as saídas dos Flip-Flops
	 signal Q : std_logic_vector(7 downto 0);
    signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : STD_LOGIC;
begin

    -- Instância do Flip-Flop T para o bit menos significativo (Q0)
    FF0: entity work.FlipFlop_T
        port map (
            T   => enable,       -- T sempre 1 para alternar a cada pulso de clock
            clk => clk,
            rst => rst,
            Q   => Q0
        );

    -- Instância do Flip-Flop T para o bit Q1
    FF1: entity work.FlipFlop_T
        port map (
            T   => enable and Q0,        -- Alterna quando Q0 sobe
            clk => clk,
            rst => rst,
            Q   => Q1
        );

    -- Instância do Flip-Flop T para o bit Q2
    FF2: entity work.FlipFlop_T
        port map (
            T   => enable and Q0 and Q1, -- Alterna quando Q0 e Q1 são 1
            clk => clk,
            rst => rst,
            Q   => Q2
        );

    -- Instância do Flip-Flop T para o bit Q3
    FF3: entity work.FlipFlop_T
        port map (
            T   => enable and Q0 and Q1 and Q2,  -- Alterna quando Q0, Q1 e Q2 são 1
            clk => clk,
            rst => rst,
            Q   => Q3
        );

    -- Instância do Flip-Flop T para o bit Q4
    FF4: entity work.FlipFlop_T
        port map (
            T   => enable and Q0 and Q1 and Q2 and Q3,  -- Alterna quando Q0, Q1, Q2 e Q3 são 1
            clk => clk,
            rst => rst,
            Q   => Q4
        );

    -- Instância do Flip-Flop T para o bit Q5
    FF5: entity work.FlipFlop_T
        port map (
            T   => enable and Q0 and Q1 and Q2 and Q3 and Q4,  -- Alterna quando Q0 a Q4 são 1
            clk => clk,
            rst => rst,
            Q   => Q5
        );

    -- Instância do Flip-Flop T para o bit Q6
    FF6: entity work.FlipFlop_T
        port map (
            T   =>  enable and Q0 and Q1 and Q2 and Q3 and Q4 and Q5,  -- Alterna quando Q0 a Q5 são 1
            clk => clk,
            rst => rst,
            Q   => Q6
        );

    -- Instância do Flip-Flop T para o bit Q7
    FF7: entity work.FlipFlop_T
        port map (
            T   => enable and Q0 and Q1 and Q2 and Q3 and Q4 and Q5 and Q6,  -- Alterna quando Q0 a Q6 são 1
            clk => clk,
            rst => rst,
            Q   => Q7
        );

    -- Atribuição da saída do contador
    Q <= (Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0);
	 
	     process (Q)
    begin
        case Q(3 downto 0) is
            when "0000" => HEX0 <= "1000000"; -- 0
            when "0001" => HEX0 <= "1111001"; -- 1
            when "0010" => HEX0 <= "0100100"; -- 2
            when "0011" => HEX0 <= "0110000"; -- 3
            when "0100" => HEX0 <= "0011001"; -- 4
            when "0101" => HEX0 <= "0010010"; -- 5
            when "0110" => HEX0 <= "0000010"; -- 6
            when "0111" => HEX0 <= "1111000"; -- 7
            when "1000" => HEX0 <= "0000000"; -- 8
            when "1001" => HEX0 <= "0010000"; -- 9
            when "1010" => HEX0 <= "0001000"; -- A
				when "1011" => HEX0 <= "0000011"; -- B
				when "1100" => HEX0 <= "1000110"; -- C
				when "1101" => HEX0 <= "0100001"; -- D
				when "1110" => HEX0 <= "0000110"; -- E
				when "1111" => HEX0 <= "0001110"; -- F
        end case;
		  case Q(7 downto 4) is
            when "0000" => HEX1 <= "1000000"; -- 0
            when "0001" => HEX1 <= "1111001"; -- 1
            when "0010" => HEX1 <= "0100100"; -- 2
            when "0011" => HEX1 <= "0110000"; -- 3
            when "0100" => HEX1 <= "0011001"; -- 4
            when "0101" => HEX1 <= "0010010"; -- 5
            when "0110" => HEX1 <= "0000010"; -- 6
            when "0111" => HEX1 <= "1111000"; -- 7
            when "1000" => HEX1 <= "0000000"; -- 8
            when "1001" => HEX1 <= "0010000"; -- 9
            when "1010" => HEX1 <= "0001000"; -- A
				when "1011" => HEX1 <= "0000011"; -- B
				when "1100" => HEX1 <= "1000110"; -- C
				when "1101" => HEX1 <= "0100001"; -- D
				when "1110" => HEX1 <= "0000110"; -- E
				when "1111" => HEX1 <= "0001110"; -- F
        end case;
	end process;
end Behavioral;
