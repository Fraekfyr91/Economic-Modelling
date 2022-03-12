*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;

$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\Hjemmeopgave_2_1_model
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\IOdata2_1.gms



*Loop
set k /0*19/;

parameter alphal(k)/
0        0
1        0.05
2        0.1
3        0.15
4        0.2
5        0.25
6        0.3
7        0.35
8        0.4
9        0.45
10        0.5
11        0.55
12        0.6
13        0.65
14        0.7
15        0.75
16        0.8
17        0.85
18        0.9
19        0.95
/;
*Antagelser

A_G=1;
A=A_G;
p.l=1;
p_G.l=1;
w.l=1;

LS.l=IO('OS','OF')*w.l;
L.l= IO('Lon','PS')/w.l;
L_G.l=IO('Lon','OS')/w.l;
N.fx = IO('Lon','PS')+IO('Lon','OS');

P_C.l=1;
p_F.l=1;

C.l=IO('PS','PF')/p_C.l;
C_F.l =IO('M','PF')/p_F.l;

X.l=IO('PS','X')/p_C.l;
Y.l = (IO('lon','PS'))/p.l;
Y_G.l =IO('Lon', 'OS')*w.l;
Y_Disp.l = w.l*N.l-LS.l;
gamma_G=0.3;
B_G.l= gamma_G*w.l*N.l;
P_C0 =1;
Y0 =700;
Y_G0 = 300;
Y_Disp0 =700;



*Kalibrering
E= 0.5;
Ex=5;
M= N.l;
phi = p.l*X.l;
gamma    =       (p.l * C.l) / Y_disp.l;
gamma_F  =       (p_F.l * C_F.l) / Y_disp.l;

set objekter /L, L_G,Y,Y_G,Y_Gf,p,p_G,p_F,w,C,C_F,P_C,X ,B_G,Y_Disp,LS,N,EVG1,EVG2,EVG3,EVP,EVI,EV1,EV2,EV3/;
set eksperimenter /baseline, shock1/;
parameter output(objekter, eksperimenter);

*0-stød:
solve model3 using cns;
output('L','baseline') = L.l;
output('L_G','baseline') = L_G.l;
output('Y','baseline') = Y.l;
output('Y_G','baseline') = Y_G.l;
output('Y_Gf','baseline') = Y_G.l/p_G.l;
output('p','baseline') = p.l;
output('p_G','baseline') = p_G.l;
output('p_F','baseline') = p_F.l;
output('w','baseline') = w.l;
output('C','baseline') = C.l;
output('C_F','baseline') = C_F.l;
output('P_C','baseline') = P_C.l;
output('X','baseline') = X.l;
output('B_G','baseline') = B_G.l;
output('Y_Disp','baseline') = Y_Disp.l;
output('LS','baseline') = LS.l;
output('N','baseline') = N.l;
display output;

N.fx = N.l*1.1
solve model3 using cns;
parameter output2(objekter, eksperimenter);
output2('L','shock1') = L.l;
output2('L_G','shock1') = L_G.l;
output2('Y','shock1') = Y.l;
output2('Y_G','shock1') = Y_G.l;
output2('Y_Gf','shock1') = Y_G.l/p_G.l;
output2('p','shock1') = p.l;
output2('p_G','shock1') = p_G.l;
output2('p_F','shock1') = p_F.l;
output2('w','shock1') = w.l;
output2('C','shock1') = C.l;
output2('C_F','shock1') = C_F.l;
output2('P_C','shock1') = P_C.l;
output2('X','shock1') = X.l;
output2('B_G','shock1') = B_G.l;
output2('Y_Disp','shock1') = Y_Disp.l;
output2('LS','shock1') = LS.l;
output2('N','shock1') = N.l;
display output2;


parameter outputloop;
loop(k,alpha = alphal(k);
outputloop(k,'EVG')  = (((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l;
outputloop(k,'EVP')  = ((P_C0/P_C.l-1)*Y_Disp.l);
outputloop(k,'EVI') = Y_Disp.l-Y_Disp0;
outputloop(k,'EV')  =(((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l+ ((P_C0/P_C.l-1)*Y_Disp.l)+ Y_Disp.l-Y_Disp0;
);
display  outputloop;


*  Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model1c.gdx", output,output2,outputloop;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model1c.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model1c.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model1c.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model1c.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model1c.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model1c.xlsx par= outputloop rng=ARK_navn3!A1';

