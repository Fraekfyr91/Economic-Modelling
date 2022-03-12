

set j /1, 2/;


*--------------------------------

*Parametre defineres
parameter
g
theta
mu_K
mu_H
mu_L(j)
mu_L(j)
E_Y
E_H
psi
eta
rho(j)
N(j)
delta
;

variables
K
p
p_H
Y
H
r
L(j)
w(j)
I
V
i_
C
uc
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
E_11
E_12;



* Opstiller ligningene og definerer modellen

E_1.. K/(1+g) =e= mu_K*(uc/p)**(-E_Y)*Y;
E_2.. H =e= mu_H*(p_H/p)**(-E_Y)*Y;
E_3(j).. theta*L(j) =e= mu_L(j)*((w(j)/theta)/p_H)**(-E_H)*H;
E_4.. p*Y =e= uc*(K/(1+g))+p_H*H;
E_5.. p_H*H =e= sum(j, w(j)*L(j));
E_6.. uc =e= r+delta;
E_7.. I =e= ((g+delta)/(1+g))*K;
E_8.. V =e= (p*Y-(sum(j, w(j)*L(j)))-p*I)/((r-g)/(1+g));
E_9.. 1+g =e= ((1+r)/(1+eta))**(1/psi);
E_10.. Y =e= C+I;
E_11(j).. L(j) =e= rho(j)*N(j);
E_12.. p =e= 1;




model model1 / E_1, E_2, E_3, E_4, E_5, E_6, E_7, E_8, E_9, E_10, E_11, E_12/;