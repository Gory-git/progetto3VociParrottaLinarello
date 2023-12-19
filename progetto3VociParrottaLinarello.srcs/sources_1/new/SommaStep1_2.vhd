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

signal P, R: STD_LOGIC_VECTOR (n downto 0);

begin
    P(n-1 downto 0) <= A xor B xor C;
    R(n downto 1) <= A and B and C;
    P(n)<= P(n-1);
    SP <= P;
    R(0) <= '0'; 
    VR <=R;
end Behavioral;