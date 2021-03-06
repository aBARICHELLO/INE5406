LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY reg_dec IS
GENERIC(N : INTEGER := 8);
PORT(clk, carga, dec, reset : IN STD_LOGIC;
                          d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
                          q : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END reg_dec;

ARCHITECTURE bhv OF reg_dec IS
BEGIN
    PROCESS(clk, reset)
    BEGIN
        IF reset = '1' THEN
            Q <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            IF carga = '1' THEN
                q <= d;
            ELSIF dec = '1' THEN
                q <= q - 1;
            END IF;
        END IF;
    END PROCESS;
END bhv;
