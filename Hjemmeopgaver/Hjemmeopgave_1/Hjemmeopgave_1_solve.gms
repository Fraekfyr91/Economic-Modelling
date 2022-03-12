


$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\IOdata1_1.gms
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\Hjemmeopgave_1_model
*Initialisering:
p.l(u) = 1;
w.l = 1;
Pi.l = 1;
Y.l = IO('Lon', 'PS')/p.l('c');
L.l = IO('Lon', 'PS')/w.l;
X.l = IO('PS', 'X')/p.l('c');
C.l('c') = IO('PS', 'PF')/p.l('c');
C.l('f') = IO('M', 'PF')/p.l('f');
*Kalibrering:
E = 0.5;
Ex = 5;
A = Y.l/L.l;
N = L.l;
phi = p.l('c')*X.l;
gamma(u) = (p.l(u)*C.l(u))/(w.l*L.l);
N0 = 1000;
w0 = 1;
Pi0 = 1;

set objekter /w, p, Pi, wPi, wp, Y, L, C, Cf, pfCf, X, pX, N, wN, A, phi, EV, EVI, EVP/;
set eksperimenter /baseline_HO, baseline_AR, shock1_HO, shock1_AR, shock2_HO, shock2_AR, shock3_AR/;
parameter output(objekter, eksperimenter);
*0-stød:
solve HO_luk using cns;
output('w','baseline_HO') = w.l;
output('p','baseline_HO') = p.l('c');
output('Pi','baseline_HO') = Pi.l;
output('wPi','baseline_HO') = w.l/Pi.l;
output('wp','baseline_HO') = w.l/p.l('c');
output('Y','baseline_HO') = Y.l;
output('L','baseline_HO') = L.l;
output('C','baseline_HO') = C.l('c');
output('Cf','baseline_HO') = C.l('f');
output('pfCf','baseline_HO') = p.l('f')*C.l('f');
output('X','baseline_HO') = X.l;
output('pX','baseline_HO') = p.l('c')*X.l;
output('N','baseline_HO') = N;
output('wN','baseline_HO') = w.l*N;
output('A','baseline_HO') = A;
output('phi','baseline_HO') = phi;
output('EV','baseline_HO') = (w.l*N)-(w0*N0)+((Pi0-Pi.l)/Pi.l)*w.l*N;
output('EVI','baseline_HO') = (w.l*N)-(w0*N0);
output('EVP','baseline_HO') = ((Pi0-Pi.l)/Pi.l)*w.l*N;
display output;


solve AR_luk using cns;
parameter output2(objekter, eksperimenter);
output2('w','baseline_AR') = w.l;
output2('p','baseline_AR') = p.l('c');
output2('Pi','baseline_AR') = Pi.l;
output2('wPi','baseline_AR') = w.l/Pi.l;
output2('wp','baseline_Ar') = w.l/p.l('c');
output2('Y','baseline_AR') = Y.l;
output2('L','baseline_AR') = L.l;
output2('C','baseline_AR') = C.l('c');
output2('Cf','baseline_AR') = C.l('f');
output2('pfCf','baseline_AR') = p.l('f')*C.l('f');
output2('X','baseline_AR') = X.l;
output2('pX','baseline_AR') = p.l('c')*X.l;
output2('N','baseline_AR') = N;
output2('wN','baseline_AR') = w.l*N;
output2('A','baseline_AR') = A;
output2('phi','baseline_AR') = phi;
output2('EV','baseline_AR') = (w.l*N)-(w0*N0)+((Pi0-Pi.l)/Pi.l)*w.l*N;
output2('EVI','baseline_AR') = (w.l*N)-(w0*N0);
output2('EVP','baseline_AR') = ((Pi0-Pi.l)/Pi.l)*w.l*N;
display output2;

      
*Stød 1: arbejdsudbuddet stiger med 10% i begge modeller
N = N*1.1;
solve HO_luk using cns;
parameter output3(objekter, eksperimenter);
output3('w','shock1_HO') = w.l;
output3('p','shock1_HO') = p.l('c');
output3('Pi','shock1_HO') = Pi.l;
output3('wPi','shock1_HO') = w.l/Pi.l;
output3('wp','shock1_HO') = w.l/p.l('c');
output3('Y','shock1_HO') = Y.l;
output3('L','shock1_HO') = L.l;
output3('C','shock1_HO') = C.l('c');
output3('Cf','shock1_HO') = C.l('f');
output3('pfCf','shock1_HO') = p.l('f')*C.l('f');
output3('X','shock1_HO') = X.l;
output3('pX','shock1_HO') = p.l('c')*X.l;
output3('N','shock1_HO') = N;
output3('wN','shock1_HO') = w.l*N;
output3('A','shock1_HO') = A;
output3('phi','shock1_HO') = phi;
output3('EV','shock1_HO') = (w.l*N)-(w0*N0)+((Pi0-Pi.l)/Pi.l)*w.l*N;
output3('EVI','shock1_HO') = (w.l*N)-(w0*N0);
output3('EVP','shock1_HO') = ((Pi0-Pi.l)/Pi.l)*w.l*N;
display output3;


solve AR_luk using cns;
parameter output4(objekter, eksperimenter);
output4('w','shock1_AR') = w.l;
output4('p','shock1_AR') = p.l('c');
output4('Pi','shock1_AR') = Pi.l;
output4('wPi','shock1_AR') = w.l/Pi.l;
output4('wp','shock1_AR') = w.l/p.l('c');
output4('Y','shock1_AR') = Y.l;
output4('L','shock1_AR') = L.l;
output4('C','shock1_AR') = C.l('c');
output4('Cf','shock1_AR') = C.l('f');
output4('pfCf','shock1_AR') = p.l('f')*C.l('f');
output4('X','shock1_AR') = X.l;
output4('pX','shock1_AR') = p.l('c')*X.l;
output4('N','shock1_AR') = N;
output4('wN','shock1_AR') = w.l*N;
output4('A','shock1_AR') = A;
output4('phi','shock1_AR') = phi;
output4('EV','shock1_AR') = (w.l*N)-(w0*N0)+((Pi0-Pi.l)/Pi.l)*w.l*N;
output4('EVI','shock1_AR') = (w.l*N)-(w0*N0);
output4('EVP','shock1_AR') = ((Pi0-Pi.l)/Pi.l)*w.l*N;
display output4;

N= N/1.1;
*Stød 2: Produktiviteten stiger med 10% i begge modeller

A = A*1.1;
solve HO_luk using cns;
parameter output5(objekter, eksperimenter);
output5('w','shock2_HO') = w.l;
output5('p','shock2_HO') = p.l('c');
output5('Pi','shock2_HO') = Pi.l;
output5('wPi','shock2_HO') = w.l/Pi.l;
output5('wp','shock2_HO') = w.l/p.l('c');
output5('Y','shock2_HO') = Y.l;
output5('L','shock2_HO') = L.l;
output5('C','shock2_HO') = C.l('c');
output5('Cf','shock2_HO') = C.l('f');
output5('pfCf','shock2_HO') = p.l('f')*C.l('f');
output5('X','shock2_HO') = X.l;
output5('pX','shock2_HO') = p.l('c')*X.l;
output5('N','shock2_HO') = N;
output5('wN','shock2_HO') = w.l*N;
output5('A','shock2_HO') = A;
output5('phi','shock2_HO') = phi;
output5('EV','shock2_HO') = (w.l*N)-(w0*N0)+((Pi0-Pi.l)/Pi.l)*w.l*N;
output5('EVI','shock2_HO') = (w.l*N)-(w0*N0);
output5('EVP','shock2_HO') = ((Pi0-Pi.l)/Pi.l)*w.l*N;
display output5;

solve AR_luk using cns;
parameter output6(objekter, eksperimenter);
output6('w','shock2_AR') = w.l;
output6('p','shock2_AR') = p.l('c');
output6('Pi','shock2_AR') = Pi.l;
output6('wPi','shock2_AR') = w.l/Pi.l;
output6('wp','shock2_AR') = w.l/p.l('c');
output6('Y','shock2_AR') = Y.l;
output6('L','shock2_AR') = L.l;
output6('C','shock2_AR') = C.l('c');
output6('Cf','shock2_AR') = C.l('f');
output6('pfCf','shock2_AR') = p.l('f')*C.l('f');
output6('X','shock2_AR') = X.l;
output6('pX','shock2_AR') = p.l('c')*X.l;
output6('N','shock2_AR') = N;
output6('wN','shock2_AR') = w.l*N;
output6('A','shock2_AR') = A;
output6('phi','shock2_AR') = phi;
output6('EV','shock2_AR') = (w.l*N)-(w0*N0)+((Pi0-Pi.l)/Pi.l)*w.l*N;
output6('EVI','shock2_AR') = (w.l*N)-(w0*N0);
output6('EVP','shock2_AR') = ((Pi0-Pi.l)/Pi.l)*w.l*N;
display output6;

*  Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.gdx", output,output2,output3,output4,output5,output6;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.xlsx par= output3 rng=ARK_navn3!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.xlsx par= output4 rng=ARK_navn4!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.xlsx par= output5 rng=ARK_navn5!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model1.xlsx par= output6 rng=ARK_navn6!A1';

