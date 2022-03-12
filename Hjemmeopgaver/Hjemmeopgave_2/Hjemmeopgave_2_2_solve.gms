*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;

* Indlæs model og data
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\Hjemmeopgave_2_2_model
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\IOdata2_2.gms

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
f=0.8;
A_G=1;
A=A_G;
p.l=1;
p_G.l=1;
w.l=1;
t_VAT.fx = IO('Afg','PF')/(IO('PS','PF')+IO('M','PF')-told);
t_W.fx = IO('OS','OF')/(IO('Lon','PS')+IO('Lon','OS')+transf);
t_D.fx = told/(IO('M','PF')-told);
TR.l= transf;
Y_G.l =IO('Lon', 'OS')*w.l;
M = (IO('Lon','PS')+IO('Lon','OS'))/f;
N.l = f*M;

LS.l=IO('OS','OF')+transf-IO('Afg','PF')-told -ind_skat;

L_G.l=Y_G.l/A_G;
L.l=N.l-L_G.l;
P_C.l=1;
p_F.l=1;
C.l=IO('PS','PF')/p_C.l;
C_F.l =(IO('M','PF')-told)/p_F.l;
X.l=IO('PS','X')/p_C.l;
Y.l = (IO('lon','PS'))/p.l;
Y_Disp.l = (1-t_W.l)*(w.l*N.l+TR.l)-LS.l;
B_G_bar = P_G.l*IO('Lon','OS')*w.l;
B_G.l= B_G_bar;
P_C0 = 1;
Y0 = 700;
Y_G0 =300;
Y_Disp0 =792;


*Kalibrering
E= 0.5;
Ex=5;
phi = p.l*X.l;
gamma    = p.l*C.l/Y_Disp.l*((1+t_VAT.l)*p.l/P_C.l)**E;
gamma_F  = p_F.l*C_F.l/Y_Disp.l*((1+t_VAT.l+t_D.l)*p.l/P_C.l)**E;
gamma_TR = TR.l/(w.l*(1-f)*M);


set objekter /L, L_G,Y,Y_G,Y_Gf,p,p_G,p_F,w,C,C_F,P_C,X ,B_G,Y_Disp,LS,N,TR,t_d,t_VAT,t_W,gamma,gamma_F,gamma_TR,EVG1,EVG2,EVG3, EVI,EVP,EV1,EV2,EV3, provw, provVAT, provD /;
set eksperimenter /baseline, shock1,shock2,shock3/;
parameter output(objekter, eksperimenter);
*0-stød:
solve model1 using cns;
output('t_d','baseline') = t_D.l;
output('t_VAT','baseline') = t_VAT.l;
output('t_W','baseline') = t_W.l;
output('gamma','baseline') = gamma;
output('gamma_F','baseline') = gamma_F;
output('gamma_TR','baseline') = gamma_TR;
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
output('TR','baseline') = TR.l;
output('provw','baseline') = t_W.l*(w.l*N.l+TR.l);
output('provVAT','baseline') = t_VAT.l*(p.l*C.l+p_F.l*C_F.l);
output('provD','baseline') = t_D.l*p_F.l*C_F.l;
display output;

*Sætter momssatsen endogen
LS.fx=LS.l*0;
t_W.lo = -inf;
t_w.up =inf;

solve model1 using cns;
parameter output2(objekter, eksperimenter);
output2('t_d','shock1') = t_D.l;
output2('t_VAT','shock1') = t_VAT.l;
output2('t_W','shock1') = t_W.l;
output2('gamma','shock1') = gamma;
output2('gamma_F','shock1') = gamma_F;
output2('gamma_TR','shock1') = gamma_TR;
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
output2('TR','shock1') = TR.l;
output2('provw','shock1') = t_W.l*(w.l*N.l+TR.l);
output2('provVAT','shock1') = t_VAT.l*(p.l*C.l+p_F.l*C_F.l);
output2('provD','shock1') = t_D.l*p_F.l*C_F.l;
display output2;


parameter outputloop;
loop(k,alpha = alphal(k);
outputloop(k,'EVG')  = (((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l;
outputloop(k,'EVP')  = ((P_C0/P_C.l-1)*Y_Disp.l);
outputloop(k,'EVI') = Y_Disp.l-Y_Disp0;
outputloop(k,'EV')  =(((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l+ ((P_C0/P_C.l-1)*Y_Disp.l)+ Y_Disp.l-Y_Disp0;
);
display  outputloop;

t_W.fx  = IO('OS','OF')/(IO('Lon','PS')+IO('Lon','OS')+transf);
t_VAT.lo = -inf;
t_VAt.up =inf;

solve model1 using cns;
parameter output3(objekter, eksperimenter);
output3('t_d','shock2') = t_D.l;
output3('t_VAT','shock2') = t_VAT.l;
output3('t_W','shock2') = t_W.l;
output3('gamma','shock2') = gamma;
output3('gamma_F','shock2') = gamma_F;
output3('gamma_TR','shock2') = gamma_TR;
output3('L','shock2') = L.l;
output3('L_G','shock2') = L_G.l;
output3('Y','shock2') = Y.l;
output3('Y_G','shock2') = Y_G.l;
output3('Y_Gf','shock2') = Y_G.l/p_G.l;
output3('p','shock2') = p.l;
output3('p_G','shock2') = p_G.l;
output3('p_F','shock2') = p_F.l;
output3('w','shock2') = w.l;
output3('C','shock2') = C.l;
output3('C_F','shock2') = C_F.l;
output3('P_C','shock2') = P_C.l;
output3('X','shock2') = X.l;
output3('B_G','shock2') = B_G.l;
output3('Y_Disp','shock2') = Y_Disp.l;
output3('LS','shock2') = LS.l;
output3('N','shock2') = N.l;
output3('TR','shock2') = TR.l;
output3('provw','shock2') = t_W.l*(w.l*N.l+TR.l);
output3('provVAT','shock2') = t_VAT.l*(p.l*C.l+p_F.l*C_F.l);
output3('provD','shock2') = t_D.l*p_F.l*C_F.l;
display output3;

parameter outputloop2;
loop(k,alpha = alphal(k);
outputloop2(k,'EVG')  = (((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l;
outputloop2(k,'EVP')  = ((P_C0/P_C.l-1)*Y_Disp.l);
outputloop2(k,'EVI') = Y_Disp.l-Y_Disp0;
outputloop2(k,'EV')  =(((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l+ ((P_C0/P_C.l-1)*Y_Disp.l)+ Y_Disp.l-Y_Disp0;
);
display  outputloop2;

*Sætter toldstatsen endogen
t_VAT.fx = IO('Afg','PF')/(IO('PS','PF')+IO('M','PF')-told);
t_D.lo = -inf;
t_D.up =inf;

solve model1 using cns;
parameter output4(objekter, eksperimenter);
output4('t_d','shock3') = t_D.l;
output4('t_VAT','shock3') = t_VAT.l;
output4('t_W','shock3') = t_W.l;
output4('gamma','shock3') = gamma;
output4('gamma_F','shock3') = gamma_F;
output4('gamma_TR','shock3') = gamma_TR;
output4('L','shock3') = L.l;
output4('L_G','shock3') = L_G.l;
output4('Y','shock3') = Y.l;
output4('Y_G','shock3') = Y_G.l;
output4('Y_Gf','shock3') = Y_G.l/p_G.l;
output4('p','shock3') = p.l;
output4('p_G','shock3') = p_G.l;
output4('p_F','shock3') = p_F.l;
output4('w','shock3') = w.l;
output4('C','shock3') = C.l;
output4('C_F','shock3') = C_F.l;
output4('P_C','shock3') = P_C.l;
output4('X','shock3') = X.l;
output4('B_G','shock3') = B_G.l;
output4('Y_Disp','shock3') = Y_Disp.l;
output4('LS','shock3') = LS.l;
output4('N','shock3') = N.l;
output4('TR','shock3') = TR.l;
output4('provw','shock3') = t_W.l*(w.l*N.l+TR.l);
output4('provVAT','shock3') = t_VAT.l*(p.l*C.l+p_F.l*C_F.l);
output4('provD','shock3') = t_D.l*p_F.l*C_F.l;
display output4;

parameter outputloop3;
loop(k,alpha = alphal(k);
outputloop3(k,'EVG')  = (((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l;
outputloop3(k,'EVP')  = ((P_C0/P_C.l-1)*Y_Disp.l);
outputloop3(k,'EVI') = Y_Disp.l-Y_Disp0;
outputloop3(k,'EV')  =(((Y_G.l/Y_G0))**(alpha/(1-alpha))-1)*(P_C0/P_C.l)*Y_Disp.l+ ((P_C0/P_C.l-1)*Y_Disp.l)+ Y_Disp.l-Y_Disp0;
);
display  outputloop3;


*  Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx", output,output2,output3,output4 ,outputloop, outputloop2, outputloop3;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.xlsx par= output3 rng=ARK_navn3!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.xlsx par= output4 rng=ARK_navn4!A1';

execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.xlsx par= outputloop rng=ARK_navn5!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.xlsx par= outputloop2 rng=ARK_navn6!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_2\solve_model2.xlsx par= outputloop3 rng=ARK_navn7!A1';








