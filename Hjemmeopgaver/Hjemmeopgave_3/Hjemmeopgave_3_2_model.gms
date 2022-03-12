*--------------------------------

*Parametre defineres
parameter
g
theta
mu_K
mu_H
mu_L
E
rho
N_bar
delta
Bf_bar
alpha
r
;

variables
K
p
Y
L
w
I
V
C
uc
B
NX
;
               
equations 
E_1
E_2
E_3
E_4
E_5
E_6
E_7
E_8
E_9
E_10
E_11;



* Opstiller ligningene og definerer modellen

E_1.. K/(1+g) =e= mu_k*(uc/p)**(-E)*Y;
E_2.. theta*L =e= mu_L*((w/theta)/p)**(-E)*Y;
E_3.. p*Y =e= (uc*K)/(1+g)+w*L;
E_4.. uc =e= r+delta;
E_5.. I =e= ((g+delta)/(1+g))*K;
E_6.. V =e= (p*Y-w*L-p*I)/((r-g)/(1+g));
E_7.. C =e= ((r-g)/(1+g))*B+w*L;
E_8.. Y =e= C+I+NX;
E_9.. L =e= N_bar;
E_10.. B =e= BF_bar+alpha*V;
E_11.. p =e= 1;



model model2 / E_1, E_2, E_3, E_4, E_5, E_6, E_7, E_8, E_9, E_10, E_11/;