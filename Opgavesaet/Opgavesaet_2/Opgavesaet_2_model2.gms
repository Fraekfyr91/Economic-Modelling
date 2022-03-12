*** Opgave 2
*** - Udvidelse af verdens simpleste ligevægts model

*2.2.1 Indfør ligningen for A i verdenssimpleste ligevægtsmodel
variables  L, Y, A, w, N_bar, C, p, A0 ;
parameter theta 'Produktivitets vækst';
Equations E_L, P_Y, L_N, C_N, p_, E_A;
E_L.. L =e= Y/A;
P_Y.. p*Y =e= w*L;
L_N.. L =e= N_bar;
C_N.. C =e= (w/p)*N_bar;
p_.. p =e= 1;
E_A.. A =e= theta* Y+A0

Model model2/
E_L
p_Y
L_N
C_N
p_
E_A/;

