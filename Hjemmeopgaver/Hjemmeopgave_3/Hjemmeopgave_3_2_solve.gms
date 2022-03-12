*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;


$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\Hjemmeopgave_3_2_model
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\IOdata3_2.gms


*Antagelser

r = 0.05;
E = 0.7;
g = 0.02;
NX.l = 0;
alpha = 1;
Bf_bar = 0;
theta = 1;
p.l = 1;
w.l = 1;
C.l = IO('PS', 'C')/p.l;
I.l = IO('PS', 'I')/p.l;
N_bar = IO('lon', 'PS')/w.l;
Y.l = IO('PS', 'C')/p.l+IO('PS', 'I')/p.l;
L.l = IO('lon', 'PS')/w.l;
*Kalibrering:

delta = (IO('PS', 'I')*r-IO('Rest', 'PS')*g)/(IO('Rest', 'PS')-IO('PS', 'I'));
K.l = IO('Rest', 'PS')*((1+g)/(r+delta));
V.l = (p.l*Y.l-w.l*L.l-p.l*IO('PS', 'I'))/((r-g)/(1+g));
B.l = V.l;
uc.l = r+delta;
mu_K = K.l/((1+g)*Y.l)*(p.l/uc.l)**(-E);
mu_L = (L.l/Y.l);




*** Spørg om uc eller i er exogen, får rigtig ved uc som exo, får halv r ved i som exo.
set objekter / Y,K, L ,w, p , r ,I ,V  ,i_ ,C, g, theta ,delta ,mu_K,mu_H,mu_L,uc/;
set eksperimenter /baseline, shock1,baseline2, shock2/;
parameter output(objekter, eksperimenter);

*0-stød:
solve model2 using cns;
output('Y','baseline') = Y.l;
output('K','baseline') = K.l;
output('L','baseline') = L.l;
output('w','baseline') = w.l;
output('p','baseline') = p.l;
output('r','baseline') = r;
output('I','baseline') = I.l;
output('V','baseline') = V.l;
output('C','baseline') = C.l;
output('g','baseline') = g;
output('theta','baseline') = theta;
output('delta','baseline') = delta;
output('mu_K','baseline') = mu_K;
output('mu_L','baseline') = mu_L;
output('uc','baseline') = uc.l;
display output;

theta= theta*1.1;
solve model2 using cns;
parameter output2(objekter, eksperimenter);
output2('Y','shock1') = Y.l;
output2('K','shock1') = K.l;
output2('L','shock1') = L.l;
output2('w','shock1') = w.l;
output2('p','shock1') = p.l;
output2('r','shock1') = r;
output2('I','shock1') = I.l;
output2('V','shock1') = V.l;
output2('C','shock1') = C.l;
output2('g','shock1') = g;
output2('theta','shock1') = theta;
output2('delta','shock1') = delta;
output2('mu_K','shock1') = mu_K;
output2('mu_L','shock1') = mu_L;
output2('uc','shock1') = uc.l;
display output2;

*Kalibrering2: 0-stød
r = 0.05;
E = 0.7;
g = 0.02;
NX.l = 0;
theta = 1;
p.l = 1;
w.l = 1;
C.l = IO('PS', 'C')/p.l;
I.l = IO('PS', 'I')/p.l;
L.l = IO('lon', 'PS')/w.l;
Y.l = IO('PS', 'C')/p.l+IO('PS', 'I')/p.l;
N_bar = IO('lon', 'PS')/w.l;
delta = (IO('PS', 'I')*r-IO('Rest', 'PS')*g)/(IO('Rest', 'PS')-IO('PS', 'I'));
K.l = IO('Rest', 'PS')*((1+g)/(r+delta));
V.l = (p.l*Y.l-w.l*L.l-p.l*IO('PS', 'I'))/((r-g)/(1+g));
B.l = V.l;
alpha = 1/2;
Bf_bar = (1/2)*B.l;
uc.l = r+delta;
mu_K = K.l/((1+g)*Y.l)*(p.l/uc.l)**(-E);;
mu_L = (L.l/Y.l);



solve model2 using cns;
parameter output3(objekter, eksperimenter);
output3('Y','baseline2') = Y.l;
output3('K','baseline2') = K.l;
output3('L','baseline2') = L.l;
output3('w','baseline2') = w.l;
output3('p','baseline2') = p.l;
output3('r','baseline2') = r;
output3('I','baseline2') = I.l;
output3('V','baseline2') = V.l;
output3('C','baseline2') = C.l;
output3('g','baseline2') = g;
output3('theta','baseline2') = theta;
output3('delta','baseline2') = delta;
output3('mu_K','baseline2') = mu_K;
output3('mu_L','baseline2') = mu_L;
output3('uc','baseline2') = uc.l;
display output3;

theta= theta*1.1;

solve model2 using cns;
parameter output4(objekter, eksperimenter);
output4('Y','shock2') = Y.l;
output4('K','shock2') = K.l;
output4('L','shock2') = L.l;
output4('w','shock2') = w.l;
output4('p','shock2') = p.l;
output4('r','shock2') = r;
output4('I','shock2') = I.l;
output4('V','shock2') = V.l;
output4('C','shock2') = C.l;
output4('g','shock2') = g;
output4('theta','shock2') = theta;
output4('delta','shock2') = delta;
output4('mu_K','shock2') = mu_K;
output4('mu_L','shock2') = mu_L;
output4('uc','shock2') = uc.l;
display output4;

*  Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.gdx", output,output2,output3,output4;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.xlsx par= output3 rng=ARK_navn3!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model2.xlsx par= output rng=ARK_navn3!A1';

