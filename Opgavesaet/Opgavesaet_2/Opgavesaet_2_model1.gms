*** Opgavesæt 2 ***
*** - Verdens simpleste ligevægtsmodel
*2.1.1 Definer objekter og dimensioner
variables  L, Y, A, w, N_bar, C, p ;

*2.1.1 Opstil ligningerne og definer modellen
Equations E_L, P_Y, L_N, C_N, p_;
E_L.. L =e= Y/A;
P_Y.. p*Y =e= w*L;
L_N.. L =e= N_bar;
C_N.. C =e= (w/p)*N_bar;
p_.. p =e= 1;
Model model1/
E_L
p_Y
L_N
C_N
p_/;

