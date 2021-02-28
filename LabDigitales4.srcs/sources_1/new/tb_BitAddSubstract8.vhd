library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_BitAddSubstract8 is
--  Port ( );
end tb_BitAddSubstract8;

architecture Behavioral of tb_BitAddSubstract8 is
component BitAddSubstract8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           restar : in STD_LOGIC;
           carry_out : out STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0);
           c_ov : out std_logic);
end component;

--ENTRADAS
SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL T : STD_LOGIC := '0';

--SALIDAS
SIGNAL C_flag, Ov_flag : STD_LOGIC;
SIGNAL R : STD_LOGIC_VECTOR(7 DOWNTO 0);

CONSTANT period : TIME := 5 ns;

begin
DUT : BitAddSubstract8
PORT MAP(A => A,
         B => B,
         restar => T,
         carry_out => C_flag,
         c_ov => Ov_flag, 
         res => R);

PROCESS
BEGIN
    --RESET
    WAIT FOR 50 NS;
    WAIT FOR PERIOD * 10;
    
    --ESTIMULOS DE SUMA
    T <= '0';
    
    A <= x"07"; -- 7 
    B <= x"04"; -- 4
    WAIT FOR PERIOD * 10;
    A <= x"0F"; -- 15
    B <= x"FA"; -- -6
    WAIT FOR PERIOD * 10;
    A <= x"10"; -- 16
    B <= x"E8"; -- -24
    WAIT FOR PERIOD * 10;
    A <= x"FB"; -- -5
    B <= x"F7"; -- -9
    WAIT FOR PERIOD * 10;
    A <= x"7D"; -- 125
    B <= x"3A"; -- 58
    WAIT FOR PERIOD * 10;
    
    --ESTIMULOS DE RESTA
    T <= '1';
    
    A <= x"0F"; -- 15
    B <= x"06"; -- 6
    WAIT FOR PERIOD * 10;
    A <= x"10"; -- 16
    B <= x"18"; -- 24
    WAIT FOR PERIOD * 10;
    A <= x"82"; -- -125
    B <= x"34"; -- 58
    WAIT FOR PERIOD * 10;
    A <= x"FA"; -- -6
    B <= x"0C"; -- 13
    WAIT FOR PERIOD * 10;
    A <= x"00"; -- 0
    B <= x"00"; -- 0
    
    WAIT;
    END PROCESS; 
end Behavioral;
