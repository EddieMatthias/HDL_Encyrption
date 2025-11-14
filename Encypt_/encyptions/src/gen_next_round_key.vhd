Library ieee;
use ieee.std_logic_1164.all;

--Generates the next round key were one key consists of 4 words
--and 1 word consists of 4 bytes
entity nextRoundKey is
    port(input_key:  in std_logic_vector(127 downto 0);
         output_key: out std_logic_vector(127 downto 0));
end;

--Implement code to divide key into its 4 words, get temporary word,
--then xor every word to get new round key. See below:
--https://www.youtube.com/watch?v=OvipL5OEWCY	  

--Implementation is not correct. I need to rewatch the video
--and correct the code, so that it follows the correct process 

--Use for W3: data_out <= rotate_left(data_in, 2); -> Rotated data_in left by 2 bits
architecture behavioral of nextRoundKey is
signal W0, W1, W2, W3, W0_changed, W1_changed, W2_changed, W3_changed: std_logic_vector(31 downto 0);
signal A0, A1, A2, A3, B0, B1, B2, B3, C0, C1, C2, C3, D0, D1, D2, D3: std_logic_vector(7 downto 0); 
signal ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9, ST10, ST11, ST12, ST13, ST14, ST15: std_logic_vector(7 downto 0);

component sTable is
	port(input_byte:  in std_logic_vector(7 downto 0);
         output_byte: out std_logic_vector(7 downto 0));	
end component;

begin
	W0 <= input_key(127 downto 96);
	W1 <= input_key(95 downto 64);
	W2 <= input_key(63 downto 32);
	W3 <= input_key(31 downto 0); 
	
	A0 <= W0(31 downto 24);
	A1 <= W0(23 downto 16);
	A2 <= W0(15 downto 8);
	A3 <= W0(7 downto 0);
	
	B0 <= W1(31 downto 24);
	B1 <= W1(23 downto 16);
	B2 <= W1(15 downto 8);
	B3 <= W1(7 downto 0); 
	
	C0 <= W2(31 downto 24);
	C1 <= W2(23 downto 16);
	C2 <= W2(15 downto 8);
	C3 <= W2(7 downto 0);
	
	D0 <= W3(31 downto 24);
	D1 <= W3(23 downto 16);
	D2 <= W3(15 downto 8);
	D3 <= W3(7 downto 0);
	
	STA0: sTable port map(A0, ST0); 
	STA1: sTable port map(A1, ST1);
	STA2: sTable port map(A2, ST2); 
	STA3: sTable port map(A3, ST3);
	
	STB0: sTable port map(B0, ST4); 
	STB1: sTable port map(B1, ST5);
	STB2: sTable port map(B2, ST6); 
	STB3: sTable port map(B3, ST7);	
	
	STC0: sTable port map(C0, ST8); 
	STC1: sTable port map(C1, ST9);
	STC2: sTable port map(C2, ST10); 
	STC3: sTable port map(C3, ST11);
	
	STD0: sTable port map(D0, ST12); 
	STD1: sTable port map(D1, ST13);
	STD2: sTable port map(D2, ST14); 
	STD3: sTable port map(D3, ST15);

	W0_changed <= ST0 & ST1 & ST2 & ST3;
	W1_changed <= ST4 & ST5 & ST6 & ST7;
	W2_changed <= ST8 & ST9 & ST10 & ST11;
	W3_changed <= ST12 & ST13 & ST14 & ST15;  
	
	output_key <= W0_changed & W1_changed & W2_changed & W3_changed;
end architecture;