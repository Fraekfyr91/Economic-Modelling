
*reset t
$onMultiR
*-----------------------------------------------------
* Opgavesæt 4.2
* Simpel Solow model uden befolkningsvækst
*-----------------------------------------------------
*Definer 50 perioder
set t /t0 * t50/;

*Definer parametre og variable
parameter
delta
alpha;

variables
y(t)
s(t)
k(t)
c(t)
i(t);

*Definer ligninger og opsæt modellen
equations
E_1(t) 'Output/ indkomst per person'
E_2(t) 'Kapital per person'
E_3(t) 'Investeringer per person'
E_4(t) 'Privatforbrug per person'
;

E_1(t) $ (ord(t) gt 1).. y(t) =e= k(t)**alpha;
E_2(t) $ (ord(t) gt 1).. k(t) =e= (1-delta)*k(t-1) + i(t-1);
E_3(t) $ (ord(t) gt 1).. i(t) =e= s(t)*y(t);
E_4(t) $ (ord(t) gt 1).. c(t) =e= (1-s(t))*y(t);

model model2 / E_1, E_2, E_3, E_4/;

