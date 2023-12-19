library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity Simulazione is
    generic(n: integer:= 16);
end Simulazione;

architecture Behavioral of Simulazione is
component SommatoreCarrySave
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC_VECTOR (n-1 downto 0);
           clk: in STD_LOGIC;
           clear : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n+1 downto 0));
end component;

signal A, B, C: STD_LOGIC_VECTOR (n-1 downto 0);
signal S: STD_LOGIC_VECTOR (n+1 downto 0);
signal clk, clr: STD_LOGIC; 
constant t: time:= 10ns;

begin
    
    circuito: SommatoreCarrySave port map(A, B, C, clk, clr, S);
    
    clock: process begin
        clk <= '0';
        wait for t/2;
        clk <= '1';
        wait for t/2;
    end process;
      
    ingresso: process begin
        clr <= '1';
        wait until falling_edge(clk); 
        clr <= '0';
        wait for 3ns;
        A <= "0000000000000001";
        B <= "0000000000000001";
        C <= "0000000000000001";
    end process;

end Behavioral;
