*-----------------------------------------------------
* Opgavesæt 4
*-----------------------------------------------------

$offsymxref offsymlist
option limcol=0, limrow=0;
option solprint=off;

* Definerer 50 perioder
set t /t0 * t50/;

parameter
delta;

variables
K(t)
I(t);

equations
E_1(t);


E_1(t) $ (ord(t) gt 1).. K(t) =e=  (1-delta)* K(t-1) +I(t);


model model1 / E_1/;
* Data
I.fx(t) = 100;
K.fx('t0')=500;

*Kalibrering
delta = I.l('t0')/K.l('t0');
K.l(t) = (1-delta)*K.l(t-1)+I.l(t);

set eksperimenter /K, shock1, shock2/;
parameter output;

*0-stød:
solve model1 using cns;
output(t,'K') = K.l(t);
output(t,'I') = I.l(t);
display output;

*Investeringsstød
*I =120 fra t9 og frem
I.fx(t)$ (ord(t) gt 9) = 120;

*0-stød:
solve model1 using cns;
parameter output2;
output2(t,'K') = K.l(t);
output2(t,'I') = I.l(t);
display output2;



*=== Export to Excel using GDX utilities
execute_unload "C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model1.gdx", output,output2;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model1.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_4\solve_model1.xlsx par= output2 rng=ARK_navn2!A1';
