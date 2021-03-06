LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registrador IS
GENERIC (N : INTEGER := 8 );
PORT(clk, carga, reset : IN STD_LOGIC;
                     d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
                     q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END registrador;

ARCHITECTURE bhv OF registrador IS
BEGIN
    PROCESS(clk, reset)
    BEGIN
        IF reset = '1' THEN
            Q <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            IF carga = '1' THEN
                q <= d;
            END IF;
        END IF;
    END PROCESS;
END bhv;
