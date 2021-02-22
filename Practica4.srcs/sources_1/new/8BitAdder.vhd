----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2021 11:10:19 AM
-- Design Name: 
-- Module Name: 8BitAdder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BitAdder8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           CarryIn : in STD_LOGIC;
           CarryOut : out STD_LOGIC;
           O : out STD_LOGIC_VECTOR (7 downto 0));
end BitAdder8;

architecture Behavioral of BitAdder8 is
    component FullAdder is
        Port (  a : in STD_LOGIC;
                b : in STD_LOGIC;
                carry_in : in STD_LOGIC;
                carry_out : out STD_LOGIC;
                res : out STD_LOGIC);
    end component;
    signal carries : STD_LOGIC_VECTOR (7 downto 0);
begin
    FA0: FullAdder port map(A(0), B(0), CarryIn, carries(0), O(0));
    FA1: FullAdder port map(A(1), B(1), carries(0), carries(1), O(1));
    FA2: FullAdder port map(A(2), B(2), carries(1), carries(2), O(2));
    FA3: FullAdder port map(A(3), B(3), carries(2), carries(3), O(3));
    FA4: FullAdder port map(A(4), B(4), carries(3), carries(4), O(4));
    FA5: FullAdder port map(A(5), B(5), carries(4), carries(5), O(5));
    FA6: FullAdder port map(A(6), B(6), carries(5), carries(6), O(6));
    FA7: FullAdder port map(A(7), B(7), carries(6), carries(7), O(7));
    CarryOut <= carries(7);
end Behavioral;
