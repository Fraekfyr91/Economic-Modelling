*------------------------------------------------------------------------*
* Data
*------------------------------------------------------------------------*
*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;


$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4/Hjemmeopgave_4_1_model

$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\IOdata41.gms

* Eksogene parametre
E.fx        = 0.7;
theta.fx(t) =1;
g.fx        =0.02;
rho.fx      =2;

*Antagelse
p.fx(t)     =1;
w.l(t)      =1;
r.l(t)      =0.05;

* Initialisering
L.fx(t)     = IO('lon','PS')/w.l(t);
C.l(t)      = IO('PS', 'C')/p.l(t);
I.l(t)      = IO('PS', 'I')/p.l(t);
Y.l(t)      = IO('PS', 'C')/p.l(t) + IO('PS', 'I')/p.l(t);

* Kalibrering
eta.fx      = (1+g.l)**(-rho.l)*(1+r.l('t0'))-1;
delta.fx(t) =  (IO('PS', 'I')*r.l('t0')-IO('Rest', 'PS')*g.l)/(IO('Rest', 'PS')-IO('PS', 'I'));

* Initialisering
K.fx('t0')  = (I.l('t0')/p.l('t0'))*((1+g.l)/(delta.l('t0')+g.l));
* ret i K
K.l(t)      = (I.l(t)/p.l(t))*((1+g.l)/(delta.l(t)+g.l));
uc.l(t)     = r.l('t0')+delta.l(t);
V.l(t)      = (p.l(t)*Y.l(t)-w.l(t)*L.l(t)-p.l(t)*I.l(t))/((r.l(t)-g.l)/(1+g.l)); ;

* Kalibrering
MyL.fx      = (L.l('t0')/Y.l('t0'));
MyK.fx      = K.l('t0')/((1+g.l)*Y.l('t0'))*(p.l('t0')/uc.l('t0'))**(-E.l);


Solve Ramsey using CNS;
parameter base;
base(t, 'K') = K.l(t);
base(t, 'Y') = Y.l(t);
base(t, 'L') = L.l(t);
base(t, 'I') = I.l(t);
base(t, 'C') = C.l(t);
base(t, 'V') = V.l(t);
base(t, 'uc') = uc.l(t);
base(t, 'w') = w.l(t);
base(t, 'r') = r.l(t);
base(t, 'p') = p.l(t);
base(t, 'delta') = delta.l(t);
base(t, 'rho') = rho.l;
base(t, 'eta') = eta.l;
base(t, 'myK') = myK.l;
base(t, 'E') = E.l;
base(t, 'g') = g.l;

display base;

theta.fx(t) $ (ord(t) gt 1) = theta.l(t)*1.1;

Solve Ramsey using CNS;
parameter shock1;
shock1(t, 'K') = K.l(t);
shock1(t, 'Y') = Y.l(t);
shock1(t, 'L') = L.l(t);
shock1(t, 'I') = I.l(t);
shock1(t, 'C') = C.l(t);
shock1(t, 'V') = V.l(t);
shock1(t, 'uc') = uc.l(t);
shock1(t, 'w') = w.l(t);
shock1(t, 'r') = r.l(t);
shock1(t, 'p') = p.l(t);
shock1(t, 'delta') = delta.l(t);
shock1(t, 'rho') = rho.l;
shock1(t, 'eta') = eta.l;
shock1(t, 'myK') = myK.l;
shock1(t, 'E') = E.l;
shock1(t, 'g') = g.l;

display shock1;
theta.fx(t) $ (ord(t) gt 1) = theta.l(t)/1.1;
theta.fx(t) $ (ord(t) gt 5) = theta.l(t)*1.1;
Solve Ramsey using CNS;
parameter shock2;
shock2(t, 'K') = K.l(t);
shock2(t, 'Y') = Y.l(t);
shock2(t, 'L') = L.l(t);
shock2(t, 'I') = I.l(t);
shock2(t, 'C') = C.l(t);
shock2(t, 'V') = V.l(t);
shock2(t, 'uc') = uc.l(t);
shock2(t, 'w') = w.l(t);
shock2(t, 'r') = r.l(t);
shock2(t, 'p') = p.l(t);
shock2(t, 'delta') = delta.l(t);
shock2(t, 'rho') = rho.l;
shock2(t, 'eta') = eta.l;
shock2(t, 'myK') = myK.l;
shock2(t, 'E') = E.l;
shock2(t, 'g') = g.l;

display shock2;

theta.fx(t) $ (ord(t) gt 5) = theta.l(t)/1.1;

* stød 4.1b

K.fx('t0')  = (I.l('t0')/p.l('t0'))*((1+g.l)/(delta.l('t0')+g.l)) *0.8;

Solve Ramsey using CNS;
parameter shock3;
shock3(t, 'K') = K.l(t);
shock3(t, 'Y') = Y.l(t);
shock3(t, 'L') = L.l(t);
shock3(t, 'I') = I.l(t);
shock3(t, 'C') = C.l(t);
shock3(t, 'V') = V.l(t);
shock3(t, 'uc') = uc.l(t);
shock3(t, 'w') = w.l(t);
shock3(t, 'r') = r.l(t);
shock3(t, 'p') = p.l(t);
shock3(t, 'delta') = delta.l(t);
shock3(t, 'rho') = rho.l;
shock3(t, 'eta') = eta.l;
shock3(t, 'myK') = myK.l;
shock3(t, 'E') = E.l;
shock3(t, 'g') = g.l;

display shock3;

K.fx('t0')  = (I.l('t0')/p.l('t0'))*((1+g.l)/(delta.l('t0')+g.l));


*Stød 4.1c: Lad kapitalens afskrivningsrate falde med 10 procent.
delta.fx(t) =  (IO('PS', 'I')*r.l('t0')-IO('Rest', 'PS')*g.l)/(IO('Rest', 'PS')-IO('PS', 'I')) * 0.9;

Solve Ramsey using CNS;
parameter shock4;
shock4(t, 'K') = K.l(t);
shock4(t, 'Y') = Y.l(t);
shock4(t, 'L') = L.l(t);
shock4(t, 'I') = I.l(t);
shock4(t, 'C') = C.l(t);
shock4(t, 'V') = V.l(t);
shock4(t, 'uc') = uc.l(t);
shock4(t, 'w') = w.l(t);
shock4(t, 'r') = r.l(t);
shock4(t, 'p') = p.l(t);
shock4(t, 'delta') = delta.l(t);
shock4(t, 'rho') = rho.l;
shock4(t, 'eta') = eta.l;
shock4(t, 'myK') = myK.l;
shock4(t, 'E') = E.l;
shock4(t, 'g') = g.l;

display shock4;




*=== First unload to GDX file (occurs during execution phase)
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.gdx", base, shock1, shock2, shock3, shock4;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.xlsx par = base rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.xlsx par = shock1 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.xlsx par = shock2 rng=ARK_navn3!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.xlsx par = shock3 rng=ARK_navn4!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model1.xlsx par = shock4 rng=ARK_navn5!A1';