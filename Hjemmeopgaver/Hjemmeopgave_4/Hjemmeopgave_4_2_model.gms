$Title Hjemmeopgave 4.2
*-------------------------------------------------*
*Objekter og dimensioner
*------------------------------------------------------------------------*
set j /1*5/;

alias(i,j);

Variables
theta(j)
L(j)
muYL(j)
w
Ey(j)
Y(j)
M(j)
muYM(j)
pM(j)
p(j)
x(i,j)
muX(i,j)
Em(j)
C(j)
gamma(j)
pC
Ec(j)
YD
N
;



Equations
E1(j)
E2(j)
E3(j)
E4(i,j)
E5(j)
E6(j)
E7
E8
E9(i)
;


E1(j)..   theta(j)*L(j) =e= muYL(j)*(w/(theta(j)*p(j)))**(-Ey(j))*Y(j);
E2(j)..   M(j)          =e= muYM(j)*(pM(j)/p(j))**(-Ey(j))*Y(j);
E3(j)..   p(j)*Y(j)     =e= pM(j)*M(j)+w*L(j);
E4(i,j).. x(i,j)        =e= muX(i,j)*(p(i)/pM(j))**(-Em(j))*M(j);
E5(j)..   pm(j)*M(j)    =e= sum(i, x(i,j)*p(i));
E6(j)..   C(j)          =e= gamma(j)*(p(j)/PC)**(-Ec(j))*(YD/pC);
E7..      YD            =e= sum(j, p(j)*C(j));
E8..      YD            =e= w*N; 
E9(i)..   Y(i)          =e= sum(j, x(i,j))+C(i);


Model Reform /ALL/;


