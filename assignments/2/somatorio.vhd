LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somatorio IS
PORT(clk, reset, inicio : IN STD_LOGIC;
                  valor : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
                   parc : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
                 pronto : OUT STD_LOGIC;
                   soma : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END somatorio;

ARCHITECTURE bhv OF somatorio IS
    COMPONENT bc IS
    PORT(reset, clk, inicio, zero   : IN STD_LOGIC;
         pronto, Cco, Dco, Cac, Rac : OUT STD_LOGIC);
    END COMPONENT;
    
    COMPONENT bo IS
    PORT(clk, Cac, Rac, Cco, Dco : IN STD_LOGIC;
                           valor : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
                            parc : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
                            zero : OUT STD_LOGIC;
                            soma : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
    
    SIGNAL Cac, Rac, Cco, Dco, zero: STD_LOGIC;

    BEGIN
        bop: bo PORT MAP(clk, Cac, Rac, Cco, Dco, valor, parc, zero, soma);
        bct: bc PORT MAP(reset, clk, inicio, zero, pronto, Cco, Dco, Cac, Rac);
END bhv;
