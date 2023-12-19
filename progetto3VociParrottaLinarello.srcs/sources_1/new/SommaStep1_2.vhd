library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SommaStep1_2 is
    generic (n:integer:=16);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC_VECTOR (n-1 downto 0);
           SP : out STD_LOGIC_VECTOR (n downto 0);
           VR : out STD_LOGIC_VECTOR (n downto 0));
end SommaStep1_2;

architecture Behavioral of SommaStep1_2 is

signal P, R: STD_LOGIC_VECTOR (n-1 downto 0);

begin
    P <= A xor B xor C;
    R <= (A and B) or (A and C) or (B and C);
    SP <= P(n-1) & P;
    VR <= R & R(0);
end Behavioral;