----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2021 08:03:08 PM
-- Design Name: 
-- Module Name: practica4 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder is
    Port (  a : in STD_LOGIC;
            b : in STD_LOGIC;
            carry_in : in STD_LOGIC;
            carry_out : out STD_LOGIC;
            res : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
begin
    res <= (carry_in and ((not a and not b) or (a and b))) or (not carry_in and ((not a and b) or (a and not b)));
    carry_out <= (a and b) or (carry_in and a) or (carry_in and b);   
end Behavioral;
