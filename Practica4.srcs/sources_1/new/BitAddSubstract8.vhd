----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2021 11:35:20 AM
-- Design Name: 
-- Module Name: BitAddSubstract8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BitAddSubstract8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           restar : in STD_LOGIC;
           carry_out : out STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0));
end BitAddSubstract8;

architecture Behavioral of BitAddSubstract8 is
    component FullAdder is
    Port (  a : in STD_LOGIC;
            b : in STD_LOGIC;
            carry_in : in STD_LOGIC;
            carry_out : out STD_LOGIC;
            res : out STD_LOGIC);
end component;
signal carries : STD_LOGIC_VECTOR (7 downto 0);
signal real_b : STD_LOGIC_VECTOR (7 downto 0);
signal b_complement2 : STD_LOGIC_VECTOR (7 downto 0);

begin
    FA0: FullAdder port map(A(0), real_b(0), '0', carries(0), res(0));
    FA1: FullAdder port map(A(1), real_b(1), carries(0), carries(1), res(1));
    FA2: FullAdder port map(A(2), real_b(2), carries(1), carries(2), res(2));
    FA3: FullAdder port map(A(3), real_b(3), carries(2), carries(3), res(3));
    FA4: FullAdder port map(A(4), real_b(4), carries(3), carries(4), res(4));
    FA5: FullAdder port map(A(5), real_b(5), carries(4), carries(5), res(5));
    FA6: FullAdder port map(A(6), real_b(6), carries(5), carries(6), res(6));
    FA7: FullAdder port map(A(7), real_b(7), carries(6), carries(7), res(7));
    carry_out <= carries(7);
    b_complement2 <= (not B) + 1;
    real_b <= b_complement2 when (restar = '1') else B when (restar = '0');
end Behavioral;
