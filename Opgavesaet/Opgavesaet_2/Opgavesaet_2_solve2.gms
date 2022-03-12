$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\Opgavesaet_2_model2

$offsymxref offsymlist
option limcol=0, limrow=0;
option solprint=off;

* 2.2.2 Initialiser og kalibrer modellen

parameter NR 'National Regnskabet';
NR =1000;
theta = 2/10000;

w.L=1;
p.L=1;
Y.L = NR/p.L;
L.L = NR/w.L;
C.L = NR/p.L;
A.L =w.L/p.L;
N_bar.FX = L.L;
A0.FX = A.L - theta*Y.L

*2.2.3 0-stødet
Solve model2 USING CNS;

display Y.L, w.L, L.L, C.L, p.L, N_bar.L, A.L, A0.L;

set objekter /Y, w, L, C, p, N_bar, A, A0/;
set eksperiment /baseline, shock1, shock2/;
parameter output(objekter,eksperiment);
output('Y','baseline')= Y.L;
output('w','baseline')= w.L;
output('L','baseline')= L.L;
output('C','baseline')= C.L;
output('P','baseline')= P.L;
output('N_bar','baseline')= N_bar.L;
output('A','baseline')= A.L;
output('A0','baseline')= A0.L;

*---------------
*Stød til modelling
*-----------------

A0.fx =A0.l*1.10;
Solve Model2 USING CNS;
parameter output2(objekter,eksperiment);
output2('Y','shock1')= Y.l;
output2('w','shock1')= w.l;
output2('L','shock1')= L.l;
output2('C','shock1')= C.l;
output2('p','shock1')= P.l;
output2('N_bar','shock1')= N_bar.l;
output2('A','shock1')= A.l;
output2('A0','shock1')= A0.l;


*_---------
*Stød 2
*-----------

A0.fx =0.8;
N_bar.fx = N_bar.l*1.05;
Solve model2 USING CNS;
parameter output3(objekter,eksperiment);
output3('Y','shock2')= Y.l;
output3('w','shock2')= w.l;
output3('L','shock2')= L.l;
output3('C','shock2')= C.l;
output3('P','shock2')= P.l;
output3('N_bar','shock2')= N_bar.l;
output3('A','shock2')= A.l;
output3('A0','shock2')= A0.l;
display output;


*=== Export to Excel using GDX utilities

*=== First unload to GDX file (occurs during execution phase)
execute_unload "C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model2.gdx", output,output2, output3;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model2.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model2.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model2.xlsx par= output3 rng=ARK_navn3!A1';
