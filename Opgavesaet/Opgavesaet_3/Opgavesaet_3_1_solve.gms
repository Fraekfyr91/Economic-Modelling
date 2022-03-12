
$offsymxref offsymlist
option limcol=0, limrow=0;
option solprint=off;

*indlæs modellen
$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\Opgavesaet_3_model

* 3.1.3 Indlæs data
$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\data_31.gms

*Antagelse af elasticiteten
E = 5;
* Pris = 1
p.l=1;

Y.l = NR/p.l;
C.l = NR/p.l;


*3.1.4 initialisering og kalibrering
*angtagelse w=1
w.l(j) = 1;
*Eksogene
N.fx(j) = lonsum(j);
mu.fx(j) = lonsum(j)/((w.l(j)/p.l**(-E))*Y.l);

*3.1.5
* 0-stød
Solve model1 USING CNS;

display Y.l,C.L, w.l, L.l, p.l, N.l, mu.l;

set objekter /Y,C, w1,w2, L1,L2, p, N, N1,N2, mu1,mu2 /;
set eksperiment /baseline, shock1, shock2, shock3/;
parameter output(objekter,eksperiment)      ;
output('Y','baseline')= Y.l                 ;
output('C','baseline')= C.l                 ;
output('w1','baseline')= w.l('1')           ;
output('w2','baseline')= w.l('2')           ;
output('L1','baseline')= L.l('1')           ;
output('L2','baseline')= L.l('2')           ;
output('p','baseline')= p.l                 ;
output('N','baseline')=(N.l('1')+N.l('2'))  ;
output('N1','baseline')= N.l('1')           ;
output('N2','baseline')= N.l('2')           ;
output('mu1','baseline')= mu.l('1')         ;
output('mu2','baseline')= mu.l('2')         ;

display output;

*--------------------------------------------
*3.1.6
* Marginal eksperimenter
*------------------------------------

* Stød 1: Lad hele befolkningen stige med 5 %
N.fx(j) = N.l(j) * 1.05;

Solve model1 USING CNS;
parameter output2(objekter,eksperiment)      ;
output2('Y','shock1')= Y.l                 ;
output2('C','shock1')= C.l                 ;
output2('w1','shock1')= w.l('1')           ;
output2('w2','shock1')= w.l('2')           ;
output2('L1','shock1')= L.l('1')           ;
output2('L2','shock1')= L.l('2')           ;
output2('p','shock1')= p.l                 ;
output2('N','shock1')=(N.l('1')+N.l('2'))  ;
output2('N1','shock1')= N.l('1')           ;
output2('N2','shock1')= N.l('2')           ;
output2('mu1','shock1')= mu.l('1')         ;
output2('mu2','shock1')= mu.l('2')         ;

display output2;
*gendanner 
N.fx(j) = lonsum(j);

*----------------------------
*Stød 2 Lad befolkningen med uddannelse 1 stige med 6,25 %


N.fx('1')= N.l('1')*1.05

Solve model1 USING CNS;
parameter output3(objekter,eksperiment)      ;
output3('Y','shock2')= Y.l                 ;
output3('C','shock2')= C.l                 ;
output3('w1','shock2')= w.l('1')           ;
output3('w2','shock2')= w.l('2')           ;
output3('L1','shock2')= L.l('1')           ;
output3('L2','shock2')= L.l('2')           ;
output3('p','shock2')= p.l                 ;
output3('N','shock2')=(N.l('1')+N.l('2'))  ;
output3('N1','shock2')= N.l('1')           ;
output3('N2','shock2')= N.l('2')           ;
output3('mu1','shock2')= mu.l('1')         ;
output3('mu2','shock2')= mu.l('2')         ;

display output3;
*gendanner
N.fx(j) = lonsum(j);

*--------------------
*Stød 3: Lad befolkningen med uddannelse 2 stige med 25 %
*-------------------------
N.fx('2')=n.l('2')*1.25
Solve model1 USING CNS;
parameter output4(objekter,eksperiment)      ;
output4('Y','shock3')= Y.l                 ;
output4('C','shock3')= C.l                 ;
output4('w1','shock3')= w.l('1')           ;
output4('w2','shock3')= w.l('2')           ;
output4('L1','shock3')= L.l('1')           ;
output4('L2','shock3')= L.l('2')           ;
output4('p','shock3')= p.l                 ;
output4('N','shock3')=(N.l('1')+N.l('2'))  ;
output4('N1','shock3')= N.l('1')           ;
output4('N2','shock3')= N.l('2')           ;
output4('mu1','shock3')= mu.l('1')         ;
output4('mu2','shock3')= mu.l('2')         ;
display output4;
*gendanner
N.fx('2')=n.l('2')/1.25;
*3.1.8 Udfør alle igen med ny antagelse omkring elasticiteten
E=0.3;

* 0-stød
Solve model1 USING CNS;

parameter output5(objekter,eksperiment)      ;
output5('Y','baseline')= Y.l                 ;
output5('C','baseline')= C.l                 ;
output5('w1','baseline')= w.l('1')           ;
output5('w2','baseline')= w.l('2')           ;
output5('L1','baseline')= L.l('1')           ;
output5('L2','baseline')= L.l('2')           ;
output5('p','baseline')= p.l                 ;
output5('N','baseline')=(N.l('1')+N.l('2'))  ;
output5('N1','baseline')= N.l('1')           ;
output5('N2','baseline')= N.l('2')           ;
output5('mu1','baseline')= mu.l('1')         ;
output5('mu2','baseline')= mu.l('2')         ;

display output5;

*--------------------------------------------
*3.1.6
* Marginal eksperimenter
*------------------------------------

* Stød 1: Lad hele befolkningen stige med 5 %
N.fx(j) = N.l(j) * 1.05;

Solve model1 USING CNS;
parameter output6(objekter,eksperiment)      ;
output6('Y','shock1')= Y.l                 ;
output6('C','shock1')= C.l                 ;
output6('w1','shock1')= w.l('1')           ;
output6('w2','shock1')= w.l('2')           ;
output6('L1','shock1')= L.l('1')           ;
output6('L2','shock1')= L.l('2')           ;
output6('p','shock1')= p.l                 ;
output6('N','shock1')=(N.l('1')+N.l('2'))  ;
output6('N1','shock1')= N.l('1')           ;
output6('N2','shock1')= N.l('2')           ;
output6('mu1','shock1')= mu.l('1')         ;
output6('mu2','shock1')= mu.l('2')         ;

display output6;
*gendanner 
N.fx(j) = lonsum(j);

*----------------------------
*Stød 2 Lad befolkningen med uddannelse 1 stige med 6,25 %


N.fx('1')= N.l('1')*1.05

Solve model1 USING CNS;
parameter output7(objekter,eksperiment)      ;
output7('Y','shock2')= Y.l                 ;
output7('C','shock2')= C.l                 ;
output7('w1','shock2')= w.l('1')           ;
output7('w2','shock2')= w.l('2')           ;
output7('L1','shock2')= L.l('1')           ;
output7('L2','shock2')= L.l('2')           ;
output7('p','shock2')= p.l                 ;
output7('N','shock2')=(N.l('1')+N.l('2'))  ;
output7('N1','shock2')= N.l('1')           ;
output7('N2','shock2')= N.l('2')           ;
output7('mu1','shock2')= mu.l('1')         ;
output7('mu2','shock2')= mu.l('2')         ;

display output7;
*gendanner
N.fx(j) = lonsum(j);

*--------------------
*Stød 3: Lad befolkningen med uddannelse 2 stige med 25 %
*-------------------------
N.fx('2')=n.l('2')*1.25
Solve model1 USING CNS;
parameter output8(objekter,eksperiment)      ;
output8('Y','shock3')= Y.l                 ;
output8('C','shock3')= C.l                 ;
output8('w1','shock3')= w.l('1')           ;
output8('w2','shock3')= w.l('2')           ;
output8('L1','shock3')= L.l('1')           ;
output8('L2','shock3')= L.l('2')           ;
output8('p','shock3')= p.l                 ;
output8('N','shock3')=(N.l('1')+N.l('2'))  ;
output8('N1','shock3')= N.l('1')           ;
output8('N2','shock3')= N.l('2')           ;
output8('mu1','shock3')= mu.l('1')         ;
output8('mu2','shock3')= mu.l('2')         ;
display output8;

* 3.1.7 Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx", output,output2, output3, output4, output5, output6, output7, output8;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output3 rng=ARK_navn3!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output4 rng=ARK_navn4!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output5 rng=ARK_navn5!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output6 rng=ARK_navn6!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output7 rng=ARK_navn7!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model1.xlsx par= output8 rng=ARK_navn8!A1';
