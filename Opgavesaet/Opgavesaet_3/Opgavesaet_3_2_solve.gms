$Title M�ling af besk�ftigelse i hovede, Opgave 3.2

*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;

*indlæs modellen
$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\Opgavesaet_3_model


*------------------------------------------------------------------------*
* Opgave 3.2.3
* Indl�sning af nationalregnskabet og befolkning
*------------------------------------------------------------------------*

$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\data_32.gms

*--------------------------------------------*
* Nationalregnskabet til opgave 3.1
* NR = pY = pC = w(1)*L(1) + w(2)*L(2) = 1000
*--------------------------------------------*

parameter NR, lonsum(j);
NR          = 1000;
lonsum('1') = 800;
lonsum('2') = 200;


*--------------------------------------------*
* Befolkning og BNP
*--------------------------------------------*

parameter
bef(j) "arbejdsstyrke med uddannelsestype j"
;
bef('1') = 3200;
bef('2') = 500;

E=10000000000000;
*------------------------------------------------------------------------*
* Opgave 3.2.4
* Initialisering og kalibrering
*------------------------------------------------------------------------*
* Antagelse
w.l(j) = 1;
*Initialisering
p.l = 1;
L.l(j)  = lonsum(j) / w.l(j);
C.l     = NR / p.l;
Y.l     = NR / p.l;

* Kalibrering
* Befolkningen er givet i data.
N.fx(j) = bef(j);
* Rho kan findes ud fra ligev�gten p� arbejdsmarkdet.
rho.fx(j)  = L.l(j)/N.l(j);
* CES fordelings parameterne
mu.fx(j) = L.l(j) / Y.l *(w.l(j)/P.l)**(-E);

*------------------------------------------------------------------------*
* Opgave 3.2.4
* 0-st�d
* Kontroler at modellene rammer sig selv
*------------------------------------------------------------------------*

solve model2 using cns

set objekter /Y, w1, w2, L, L1, L2, C, p,w_rho_N, N, N1, N2, my1, my2, rho1, rho2 /;
set eksperiment /baseline, shock1 /;
parameter output(objekter,eksperiment);
output('Y','baseline')  = Y.l;
output('w1','baseline') = w.l('1');
output('w2','baseline') = w.l('2');
output('L','baseline')    = L.l('1')+L.l('2');
output('L1','baseline') = L.l('1');
output('L2','baseline') = L.l('2');
output('C','baseline')  = C.l;
output('p','baseline')  = P.l;
output('w_rho_N', 'baseline') = sum(j,w.l(j)*rho.l(j)*N.l(j));
output('N','baseline')    = N.l('1')+N.l('2');
output('N1','baseline') = N.l('1');
output('N2','baseline') = N.l('2');
output('MY1','baseline')= Mu.l('1');
output('MY2','baseline')= Mu.l('2');
output('RHO1','baseline')= rho.l('1');
output('RHO2','baseline')= rho.l('2');
display output;

*------------------------------------------------------------------------*
* Opgave 3.3.5
*Marginaleksperimenter , 3 befolknings-/indvandringsst�d
*        Analyser effekten af, at 10.000 lavtuddannede (type 1) bliver
*        h�jtuddannede (type 2). Se blandt andet p� effekten p�
*        produktionen og l�nniveauerne for hhv. lavt- og h�jtuddannede.
*------------------------------------------------------------------------*

* St�d 1: Lad hele befolkningen  stige med 5 %.
*-----------------------------------------------*

N.fx('1') = N.l('1') -100 ;
N.fx('2') = N.l('2') +100;

solve model2 using cns;
parameter output2(objekter,eksperiment);

output2('Y','Shock1')  = Y.l      ;
output2('w1','Shock1') = w.l('1') ;
output2('w2','Shock1') = w.l('2')  ;
output2('L','Shock1')  = (L.l('1')+L.l('2')) ;
output2('L1','Shock1') = L.l('1')  ;
output2('L2','Shock1') = L.l('2')  ;
output2('C','Shock1')  = C.l      ;
output2('p','Shock1')  = P.l      ;
output2('w_rho_N', 'shock1') = sum(j,w.l(j)*rho.l(j)*N.l(j));
output2('N','Shock1')  = (N.l('1')+N.l('2')) ;
output2('N1','Shock1') = N.l('1') ;
output2('N2','Shock1') = N.l('2')  ;
output2('MY1','Shock1')= Mu.l('1') ;
output2('MY2','Shock1')= Mu.l('2') ;
output2('RHO1','Shock1')= rho.l('1');
output2('RHO2','Shock1')= rho.l('2');


* 3.1.7 Overfør til excel
execute_unload "C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model2.gdx", output,output2;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model2.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model2.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_3\solve_model2.xlsx par= output2 rng=ARK_navn2!A1';
