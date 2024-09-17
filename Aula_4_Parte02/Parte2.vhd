library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Parte2 is
    Port (
        clk       : in  STD_LOGIC;   -- Clock 
        rst       : in  STD_LOGIC;   -- Reset
		  enable : in  std_logic;
        HEX0   : out STD_LOGIC_VECTOR(6 downto 0);  -- Saída para os 7 segmentos (a, b, c, d, e, f, g)
		  HEX1   : out STD_LOGIC_VECTOR(6 downto 0);  -- Saída para os 7 segmentos (a, b, c, d, e, f, g)
		  HEX2   : out STD_LOGIC_VECTOR(6 downto 0);  -- Saída para os 7 segmentos (a, b, c, d, e, f, g)
		  HEX3   : out STD_LOGIC_VECTOR(6 downto 0)  -- Saída para os 7 segmentos (a, b, c, d, e, f, g)
    );
end Parte2;

architecture Behavioral of Parte2 is
 
    signal Q : std_logic_vector(15 downto 0);

	    -- Enable generation process
begin
process(clk)
begin
if rst = '0' then
	Q<= "0000000000000000";
elsif rising_edge(clk) then
 if enable = '1' then
	Q <= std_logic_vector(unsigned(Q) + 1);
 end if;
end if;
end process;
	 
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
		  case Q(11 downto 8) is
            when "0000" => HEX2 <= "1000000"; -- 0
            when "0001" => HEX2 <= "1111001"; -- 1
            when "0010" => HEX2 <= "0100100"; -- 2
            when "0011" => HEX2 <= "0110000"; -- 3
            when "0100" => HEX2 <= "0011001"; -- 4
            when "0101" => HEX2 <= "0010010"; -- 5
            when "0110" => HEX2 <= "0000010"; -- 6
            when "0111" => HEX2 <= "1111000"; -- 7
            when "1000" => HEX2 <= "0000000"; -- 8
            when "1001" => HEX2 <= "0010000"; -- 9
            when "1010" => HEX2 <= "0001000"; -- A
				when "1011" => HEX2 <= "0000011"; -- B
				when "1100" => HEX2 <= "1000110"; -- C
				when "1101" => HEX2 <= "0100001"; -- D
				when "1110" => HEX2 <= "0000110"; -- E
				when "1111" => HEX2 <= "0001110"; -- F
        end case;
		  case Q(15 downto 12) is
            when "0000" => HEX3 <= "1000000"; -- 0
            when "0001" => HEX3 <= "1111001"; -- 1
            when "0010" => HEX3 <= "0100100"; -- 2
            when "0011" => HEX3 <= "0110000"; -- 3
            when "0100" => HEX3 <= "0011001"; -- 4
            when "0101" => HEX3 <= "0010010"; -- 5
            when "0110" => HEX3 <= "0000010"; -- 6
            when "0111" => HEX3 <= "1111000"; -- 7
            when "1000" => HEX3 <= "0000000"; -- 8
            when "1001" => HEX3 <= "0010000"; -- 9
            when "1010" => HEX3 <= "0001000"; -- A
				when "1011" => HEX3 <= "0000011"; -- B
				when "1100" => HEX3 <= "1000110"; -- C
				when "1101" => HEX3 <= "0100001"; -- D
				when "1110" => HEX3 <= "0000110"; -- E
				when "1111" => HEX3 <= "0001110"; -- F
        end case;
    end process;

end Behavioral;