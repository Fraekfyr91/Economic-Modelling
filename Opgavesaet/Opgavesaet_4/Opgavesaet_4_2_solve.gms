$offsymxref offsymlist
option limcol=0, limrow=0;
option solprint=off;

*indlæs modellen
$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\Opgavesaet_4_2_model


* initialiser 
k.fx('t0')=1000;
k.l(t) =  k.l('t0');
i.fx('t0')=400;
i.l(t) =  i.l('t0');
y.l(t) =  500;

*Kalibrering
alpha    = log(y.l('t0')) / log(k.l('t0'));
delta    = i.l('t0')/k.l('t0');
s.fx(t)  = k.l('t0')/y.l('t0') - (1-delta)*k.l('t0')/y.l('t0');
*initialisering af c
c.l(t)=  (1-s.l(t))*y.l(t);


*0-stød:
solve model2 using cns;
parameter base;
base(t, 'k') = k.l(t);
base(t, 'k*') = (s.l(t)/delta)**(1/(1-alpha));
base(t, 'y') = y.l(t);
base(t, 'c') = c.l(t);
base(t, 'i') = i.l(t);
base(t, 's') = s.l(t);
base(t, 'alpha') = alpha;
base(t, 'delta') = delta;

display base;


s.fx(t) $ (ord(t) gt 10) = s.l(t) * 1.05;

*0-stød:
solve model2 using cns;
parameter shock;
shock(t, 'k') = k.l(t);
shock(t, 'k*') = (s.l(t)/delta)**(1/(1-alpha));
shock(t, 'y') = y.l(t);
shock(t, 'c') = c.l(t);
shock(t, 'i') = i.l(t);
shock(t, 's') = s.l(t);
shock(t, 'alpha') = alpha;
shock(t, 'delta') = delta;

display shock;
* 3.1.7 Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model2.gdx", base,shock;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model2.xlsx par= base rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model2.xlsx par= shock rng=ARK_navn2!A1';