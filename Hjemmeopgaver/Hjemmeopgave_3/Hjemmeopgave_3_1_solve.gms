*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;

$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\Hjemmeopgave_3_1_model
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\IOdata3_1.gms

*Antagelser

theta = 1;
E_Y = 0.7;
E_H = 0.2;
r.l = 0.05;
g = 0.02;
psi = 2;
N(j) = bef(j);
p_H.l = 1;
p.l = 1;
w.l(j) = 1;
I.l = IO('PS', 'I')/p.l;
C.l = IO('PS', 'C')/p.l;
Y.l = (IO('lon1', 'PS')+IO('lon2', 'PS')+IO('Rest', 'PS'))/p.l;
delta = (I.l*r.l-IO('Rest', 'PS')*g)/(IO('Rest', 'PS')-I.l);
K.l = IO('Rest', 'PS')*((1+g)/(r.l+delta));
uc.l = r.l + delta;
L.l('1') = IO('lon1', 'PS')/w.l('1');
L.l('2') = IO('lon2', 'PS')/w.l('2');

*Kalibrering:
rho(j) = L.l(j)/N(j);
eta = ((1+r.l)/((1+g)**psi))-1;
H.l = (sum(j, w.l(j)*L.l(j)))/p_H.l;
mu_L(j) = L.l(j)/H.l;
mu_H = H.l/Y.l;
mu_K = K.l/((1+g)*Y.l)*(p.l/uc.l)**(-E_Y);
V.l = (p.l*Y.l-(sum(j, w.l(j)*L.l(j)))-p.l*I.l)/((r.l-g)/(1+g));

set objekter / Y,K, L_1,L_2 ,w_L1, w_L2, p ,p_H,H , r ,I ,V  ,i_ ,C, g, theta ,delta ,mu_K,mu_H,mu_L1,mu_L2,uc,psi,rho_1,rho_2,eta/;
set eksperimenter /baseline, shock1, shock2/;
parameter output(objekter, eksperimenter);

*0-stød:
solve model1 using cns;
output('Y','baseline') = Y.l;
output('K','baseline') = K.l;
output('L_1','baseline') = L.l('1');
output('L_2','baseline') = L.l('2');
output('w_L1','baseline') = w.l('1');
output('w_L2','baseline') = w.l('2');
output('p','baseline') = p.l;
output('p_H','baseline') = p_H.l;
output('H','baseline') = H.l;
output('r','baseline') = r.l;
output('I','baseline') = I.l;
output('V','baseline') = V.l;
output('C','baseline') = C.l;
output('g','baseline') = g;
output('theta','baseline') = theta;
output('delta','baseline') = delta;
output('mu_K','baseline') = mu_K;
output('mu_H','baseline') = mu_H;
output('mu_L1','baseline') = mu_L('1');
output('mu_L2','baseline') = mu_L('2');
output('uc','baseline') = uc.l;
output('psi','baseline') = psi;
output('rho_1','baseline') = rho('1');
output('rho_2','baseline') = rho('2');
output('eta','baseline') = eta;
display output;

delta= delta*0.9;

solve model1 using cns;
parameter output2(objekter, eksperimenter);
output2('Y','shock1') = Y.l;
output2('K','shock1') = K.l;
output2('L_1','shock1') = L.l('1');
output2('L_2','shock1') = L.l('2');
output2('w_L1','shock1') =w.l('1');
output2('w_L2','shock1') = w.l('2');
output2('p','shock1') = p.l;
output2('p_H','shock1') = p_H.l;
output2('H','shock1') = H.l;
output2('r','shock1') = r.l;
output2('I','shock1') = I.l;
output2('V','shock1') = V.l;
output2('C','shock1') = C.l;
output2('g','shock1') = g;
output2('theta','shock1') = theta;
output2('delta','shock1') = delta;
output2('mu_K','shock1') = mu_K;
output2('mu_H','shock1') = mu_H;
output2('mu_L1','shock1') = mu_L('1');
output2('mu_L2','shock1') = mu_L('2');
output2('uc','shock1') = uc.l;
output2('psi','shock1') = psi;
output2('rho_1','shock1') = rho('1');
output2('rho_2','shock1') = rho('2');
output2('eta','shock1') = eta;
display output2;
delta= delta/0.9;

N('1') = N('1')-10;
N('2') = N('2')+10;
solve model1 using cns;
parameter output3(objekter, eksperimenter);
output3('Y','shock2') = Y.l;
output3('K','shock2') = K.l;
output3('L_1','shock2') = L.l('1');
output3('L_2','shock2') = L.l('2');
output3('w_L1','shock2') =w.l('1');
output3('w_L2','shock2') = w.l('2');
output3('p','shock2') = p.l;
output3('p_H','shock2') = p_H.l;
output3('H','shock2') = H.l;
output3('r','shock2') = r.l;
output3('I','shock2') = I.l;
output3('V','shock2') = V.l;
output3('C','shock2') = C.l;
output3('g','shock2') = g;
output3('theta','shock2') = theta;
output3('delta','shock2') = delta;
output3('mu_K','shock2') = mu_K;
output3('mu_H','shock2') = mu_H;
output3('mu_L1','shock2') = mu_L('1');
output3('mu_L2','shock2') = mu_L('2');
output3('uc','shock2') = uc.l;
output3('psi','shock2') = psi;
output3('rho_1','shock2') = rho('1');
output3('rho_2','shock2') = rho('2');
output3('eta','shock2') = eta;
display output3;


*  Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model1.gdx", output,output2,output3;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model1.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model1.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_3\solve_model1.xlsx par= output3 rng=ARK_navn3!A1';

