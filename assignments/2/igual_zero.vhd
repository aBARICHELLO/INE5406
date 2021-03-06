LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY igual_zero IS
GENERIC(N : INTEGER := 4);
PORT(a : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  zero : OUT STD_LOGIC);
END igual_zero;

ARCHITECTURE bhv OF igual_zero IS
BEGIN
    zero <= '1' WHEN a = 0 ELSE '0';
END bhv;
