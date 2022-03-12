*-----------------------------------------------------
* Hjemmeopgave 1.2
*-----------------------------------------------------
*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\Hjemmeopgave_1_model2
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\IOdata1_2.gms

*Antagelser
p.l(u) = 1;
w.l(j) = 1;
Pi.l = 1;
Y.l = (IO('Lon1', 'PS')+IO('Lon2', 'PS'))/p.l('c');
L.l('1') = IO('Lon1', 'PS')/w.l('1');
L.l('2') = IO('Lon2', 'PS')/w.l('2');
X.l = IO('PS', 'X')/p.l('c');
C.l('c') = IO('PS', 'PF')/p.l('c');
C.l('f') = IO('M', 'PF')/p.l('f');
*Kalibrering:
Ey = 2;
Ec = 0.5;
Ex = 5;
N(j) = bef(j);
my(j) = L.l(j)/Y.l;
rho(j) = L.l(j)/N(j);
phi = p.l('c')*X.l;
gamma(u) = (p.l(u)*C.l(u))/(sum(j, w.l(j)*N(j)*rho(j)));
*Gemmer initialværdier
N0('1') = 500;
N0('2') = 800;
w0('1') = 1;
w0('2') = 1;
rho0('1') = 1;
rho0('2') = 1500/800;
Pi0 = 1;

set objekter /w1, w2, rho1w1, rho2w2, p, Pi, w1Pi, w2Pi, w1p, w2p, Y, sumL, L1, L2, C, pC, Cf, pfCf, X, pX, sumrhowN, sumN, N1, N2, EV, EVI, EVP/;
set eksperimenter /baseline_HO, baseline_AR, shock1_HO, shock1_AR/;
parameter output(objekter, eksperimenter);

*0-stød:
solve HO_luk using cns;
output('w1','baseline_HO') = w.l('1');
output('w2','baseline_HO') = w.l('2');
output('rho1w1','baseline_HO') = rho('1')*w.l('1');
output('rho2w2','baseline_HO') = rho('2')*w.l('2');
output('p','baseline_HO') = p.l('c');
output('Pi','baseline_HO') = Pi.l;
output('w1Pi','baseline_HO') = w.l('1')/Pi.l;
output('w2Pi','baseline_HO') = w.l('2')/Pi.l;
output('w1p','baseline_HO') = w.l('1')/p.l('c');
output('w2p','baseline_HO') = w.l('2')/p.l('c');
output('Y','baseline_HO') = Y.l;
output('sumL','baseline_HO') = sum(j, L.l(j));
output('L1','baseline_HO') = L.l('1');
output('L2','baseline_HO') = L.l('2');
output('C','baseline_HO') = C.l('c');
output('pC','baseline_HO') = p.l('c')*C.l('c');
output('Cf','baseline_HO') = C.l('f');
output('pfCf','baseline_HO') = p.l('f')*C.l('f');
output('X','baseline_HO') = X.l;
output('pX','baseline_HO') = p.l('c')*X.l;
output('sumrhowN','baseline_HO') = sum(j, rho(j)*w.l(j)*N(j));
output('sumN','baseline_HO') = sum(j,N(j));
output('N1','baseline_HO') = N('1');
output('N2','baseline_HO') = N('2');
output('EV','baseline_HO') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j))+sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output('EVI','baseline_HO') = sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output('EVP','baseline_HO') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j));
display output;


parameter output2(objekter, eksperimenter);

solve AR_luk using cns;
output2('w1','baseline_AR') = w.l('1');
output2('w2','baseline_AR') = w.l('2');
output2('rho1w1','baseline_AR') = rho('1')*w.l('1');
output2('rho2w2','baseline_AR') = rho('2')*w.l('2');
output2('p','baseline_AR') = p.l('c');
output2('Pi','baseline_AR') = Pi.l;
output2('w1Pi','baseline_AR') = w.l('1')/Pi.l;
output2('w2Pi','baseline_AR') = w.l('2')/Pi.l;
output2('w1p','baseline_AR') = w.l('1')/p.l('c');
output2('w2p','baseline_AR') = w.l('2')/p.l('c');
output2('Y','baseline_AR') = Y.l;
output2('sumL','baseline_AR') = sum(j, L.l(j));
output2('L1','baseline_AR') = L.l('1');
output2('L2','baseline_AR') = L.l('2');
output2('C','baseline_AR') = C.l('c');
output2('pC','baseline_AR') = p.l('c')*C.l('c');
output2('Cf','baseline_AR') = C.l('f');
output2('pfCf','baseline_AR') = p.l('f')*C.l('f');
output2('X','baseline_AR') = X.l;
output2('pX','baseline_AR') = p.l('c')*X.l;
output2('sumrhowN','baseline_AR') = sum(j, rho(j)*w.l(j)*N(j));
output2('sumN','baseline_AR') = sum(j,N(j));
output2('N1','baseline_AR') = N('1');
output2('N2','baseline_AR') = N('2');
output2('EV','baseline_AR') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j))+sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output2('EVI','baseline_AR') = sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output2('EVP','baseline_AR') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j));
display output2;

*Stød 1: 100 lavtuddannede (type 1) videreuddannes til højtuddannede (type 2):
N('1') = N('1')-100;
N('2') = N('2')+100;

parameter output3(objekter, eksperimenter);

solve HO_luk using cns;

output3('w1','shock1_HO') = w.l('1');
output3('w2','shock1_HO') = w.l('2');
output3('rho1w1','shock1_HO') = rho('1')*w.l('1');
output3('rho2w2','shock1_HO') = rho('2')*w.l('2');
output3('p','shock1_HO') = p.l('c');
output3('Pi','shock1_HO') = Pi.l;
output3('w1Pi','shock1_HO') = w.l('1')/Pi.l;
output3('w2Pi','shock1_HO') = w.l('2')/Pi.l;
output3('w1p','shock1_HO') = w.l('1')/p.l('c');
output3('w2p','shock1_HO') = w.l('2')/p.l('c');
output3('Y','shock1_HO') = Y.l;
output3('sumL','shock1_HO') = sum(j, L.l(j));
output3('L1','shock1_HO') = L.l('1');
output3('L2','shock1_HO') = L.l('2');
output3('C','shock1_HO') = C.l('c');
output3('pC','shock1_HO') = p.l('c')*C.l('c');
output3('Cf','shock1_HO') = C.l('f');
output3('pfCf','shock1_HO') = p.l('f')*C.l('f');
output3('X','shock1_HO') = X.l;
output3('pX','shock1_HO') = p.l('c')*X.l;
output3('sumrhowN','shock1_HO') = sum(j, rho(j)*w.l(j)*N(j));
output3('sumN','shock1_HO') = sum(j,N(j));
output3('N1','shock1_HO') = N('1');
output3('N2','shock1_HO') = N('2');
output3('EV','shock1_HO') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j))+sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output3('EVI','shock1_HO') = sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output3('EVP','shock1_HO') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j));
display output3;

parameter output4(objekter, eksperimenter);
solve AR_luk using cns;
output4('w1','shock1_AR') = w.l('1');
output4('w2','shock1_AR') = w.l('2');
output4('rho1w1','shock1_AR') = rho('1')*w.l('1');
output4('rho2w2','shock1_AR') = rho('2')*w.l('2');
output4('p','shock1_AR') = p.l('c');
output4('Pi','shock1_AR') = Pi.l;
output4('w1Pi','shock1_AR') = w.l('1')/Pi.l;
output4('w2Pi','shock1_AR') = w.l('2')/Pi.l;
output4('w1p','shock1_AR') = w.l('1')/p.l('c');
output4('w2p','shock1_AR') = w.l('2')/p.l('c');
output4('Y','shock1_AR') = Y.l;
output4('sumL','shock1_AR') = sum(j, L.l(j));
output4('L1','shock1_AR') = L.l('1');
output4('L2','shock1_AR') = L.l('2');
output4('C','shock1_AR') = C.l('c');
output4('pC','shock1_AR') = p.l('c')*C.l('c');
output4('Cf','shock1_AR') = C.l('f');
output4('pfCf','shock1_AR') = p.l('f')*C.l('f');
output4('X','shock1_AR') = X.l;
output4('pX','shock1_AR') = p.l('c')*X.l;
output4('sumrhowN','shock1_AR') = sum(j, rho(j)*w.l(j)*N(j));
output4('sumN','shock1_AR') = sum(j,N(j));
output4('N1','shock1_AR') = N('1');
output4('N2','shock1_AR') = N('2');
output4('EV','shock1_AR') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j))+sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output4('EVI','shock1_AR') = sum(j, w.l(j)*rho(j)*N(j))-sum(j, w0(j)*rho0(j)*N0(j));
output4('EVP','shock1_AR') = ((Pi0-Pi.l)/Pi.l)*sum(j, w.l(j)*rho(j)*N(j));
display output4;


*  Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.gdx", output,output2,output3,output4;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.xlsx par= output3 rng=ARK_navn3!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_1\solve_model2.xlsx par= output4 rng=ARK_navn4!A1';
