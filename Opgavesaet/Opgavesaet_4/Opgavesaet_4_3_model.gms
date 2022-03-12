*-----------------------------------------------------
* Opgavesæt 4.3
* Keynes-Ramsey forbruger
*-----------------------------------------------------
*reset t
$onMultiR
*setter t til 50 perioder
set t /t0 * t50/;
*Definerer parametre og variable
parameter
rho
eta
r(t);

variables
C(t)
B(t)
Y(t)
p(t);

*definerer ligninger og sætter modellen op
equations
E_1(t)
E_2(t)
E_2term;

E_1(t) $ (ord(t) gt 1 and ord(t) lt card(t)).. C(t+1) =e= ((1+r(t+1))/(1+eta))**(1/rho)*C(t);
E_2(t) $ (ord(t) gt 1).. B(t) =e= (1+r(t))*B(t-1)+Y(t)-p(t)*C(t);
E_2term.. B('t50') =e= B('t49');

model model3 / E_1, E_2, E_2term/;

