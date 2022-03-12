$Title Offentlig sector i lille åben økonomi

*Parametre defineres
parameter
A Teknologi
A_G Offentlig teknologi
alpha
gamma  
gamma_F
gamma_TR

P_C0
Y0
Y_G0
Y_Disp0

f Ervhervsfrekvens
M basisbefolkning
E indlandsk elasticitet
Ex Eksport elasticitet
phi eksport parameter
B_G_bar
;

variables
L beskæftigelse privat sektor
L_G beskæftigelse offentlig sektor
Y produktion
Y_G produktion offentlig sektor
p pris
p_G reguleringsordningen
p_F udenladske priser
w løn
C forbrug
C_F forbrug af udenlandske varer
P_C prisindeks
X eksport
B_G offentligt budget
TR transfereringer til husholdningerne
Y_Disp disponibel inkomst
LS lump-sum skatter
TR trasferering til husholdningerne
*eksogene
N Befolkning
t_W

t_VAT
t_D
;
               
equations 
E_1 Efterspørgselssystem for den private sektor 
E_2 Nul-profit
E_3 Efterspørgselssystem for den offentlige sektor 
E_4 Definition ad enhedsomkostninger
E_5 Politikernes adfærd
E_6 Offentlige finanser S=0
E_7 Ligevægt på arbejdsmarkedet
E_8 
E_9 Forbrugernes efterspørgselssystem
E_10 Forbrug af indenlandske varer
E_11 Forbrug af udenlandske varer
E_12 Disponibel indkomst
E_13 Udenlandske priser (nummerere)
E_14 Armington lukning
E_15 Varemarkedets ligevægt
E_16
E_17;

* Opstiller ligningene og definerer modellen

E_1.. L =e= Y/A;
E_2.. p*Y =e= w*L;
E_3.. L_G =e= Y_G/A_G;
E_4.. p_G*Y_G=e=w*L_G;
E_5.. p_G*Y_G =e= B_G;
E_6.. t_W*(w*N+TR)+t_VAT*(p*C+p_F*C_F)+t_D*p_F*C_F+LS-w*L_G-TR=e= 0;
E_7.. L+L_G =e= N;
E_8.. B_G =e= B_G_bar;
E_9.. Y_Disp =e= (1-t_W)*(w*N+TR)-LS;
E_10.. C =e= gamma*((1+t_VAT)*p/P_C)**(-E)*Y_Disp/P_C;
E_11.. C_F =e= gamma_F*((1+t_VAT+t_D)*p_F/P_C)**(-E)*Y_Disp/P_C;
E_12.. (1+t_VAT)*p*C+(1+t_VAT+t_D)*p_F*C_F =e=Y_Disp;
E_13.. p_F=e=1;
E_14.. X=e=phi*(p/p_F)**(-Ex);
E_15.. Y=e=C+X;
E_16.. TR =e= gamma_TR*w*(1-f)*M;
E_17.. N =e= f*M;


model model1 /E_1, E_2, E_3, E_4,E_5 E_6, E_7,E_8, E_9, E_10, E_11, E_12, E_13, E_14, E_15, E_16, E_17/;
