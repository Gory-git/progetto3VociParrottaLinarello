library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sommatore is
    generic (n:integer:=16);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           S : out STD_LOGIC_VECTOR (n downto 0));
end Sommatore;

architecture Behavioral of Sommatore is

signal Ra, Rb, P, G: STD_LOGIC_VECTOR (n downto 0);
signal c: STD_LOGIC_VECTOR (n+1 downto 0);

begin
    Ra <= A(n-1) & A;
    Rb <= B(n-1) & B;
    P<=Ra xor Rb;
    G<=Ra and Rb;
    Ra(n)<=Ra(n-1); Rb(n)<=Rb(n-1);
    c(0)<='0';
    c(n+1 downto 1)<=G or (P and c(n downto 0));
    S<=P xor c(n downto 0);
end Behavioral;