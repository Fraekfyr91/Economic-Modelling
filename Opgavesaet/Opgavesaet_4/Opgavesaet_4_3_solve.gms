
*indlæs modellen
$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\Opgavesaet_4_3_model


$offsymxref offsymlist
option limcol=0, limrow=0;
option solprint=off;


*Initialiserer variable
Y.fx(t) =  1000;
B.fx('t0') = 700;

eta = 0.04;
rho = 2;
p.fx(t)= 1;

* kalibrering
r(t)       = eta;

* initialisering
B.l(t) = 700 ;
*isoler Ct i ligning 2.
C.l(t)=(r(t)*B.l(t)+Y.l(t))/p.l(t);

*0-stød:
solve model3 using cns;
parameter base;
base(t, 'C') = C.l(t);
base(t, 'r') = r(t);
base(t, 'B') = B.l(t);
base(t, 'Y') = Y.l(t);
display base;


Y.fx(t) $ (ord(t) gt 20) = Y.l(t)*1.05;

Solve model3 using CNS;
parameter shock;
shock(t,'C')=C.l(t);
shock(t,'r')=r(t);
shock(t,'B')=B.l(t);
shock(t,'Y')=Y.l(t);
display shock;

* 3.1.7 Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model3.gdx", base,shock;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model3.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model3.xlsx par= base rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model3.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model3.xlsx par= shock rng=ARK_navn2!A1';