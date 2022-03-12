
$include C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\Opgavesaet_2_model1

$offsymxref offsymlist
option limcol=0, limrow=0;
option solprint=off;

*2.1.3 Data 
parameter NR 'National Regnskabet';
NR =1000;

*2.1.4 Initialisering og kalibrering
w.L=1;
p.L=1;
Y.L = NR/p.L;
L.L = NR/w.L;
C.L = NR/p.L;

A.FX =Y.L/L.L;
N_bar.FX = L.L;


*2.1.5 0-stød 
solve model1 USING CNS;

*---------------------------------
set objekter /L, Y, A, w, N_bar, C, p/;
set eksperiment /baseline, shock1, shock2/;
parameter output(objekter,eksperiment);
output('Y','baseline')= Y.l;
output('w','baseline')= w.l;
output('L','baseline')= L.l;
output('C','baseline')= C.l;
output('p','baseline')= P.l;
output('N_bar','baseline')= N_bar.l;
output('A','baseline')= A.l;
display output;


*------------------------------------------------------------------------*
* Opgave 2.1.6 a
* Stød 1
* Lad produktiviteten stige med 10 %.
*------------------------------------------------------------------------*

A.fx = A.l * 1.10;

Solve model1 USING CNS;

parameter output2(objekter,eksperiment);
output2('Y','baseline')= Y.l;
output2('w','baseline')= w.l;
output2('L','baseline')= L.l;
output2('C','baseline')= C.l;
output2('p','baseline')= P.l;
output2('N_bar','baseline')= N_bar.l;
output2('A','baseline')= A.l;
display output2;



*------------------------------------------------------------------------*
* Opgave 2.1.6 b
* Stød 2
* Lad befolkningen stige med 5 %.
*------------------------------------------------------------------------*
N_bar.fx = N_bar.l* 1.05;
* bemærk at der stødes til n_bar da denne er eksogen
A.fx = 1;
* bemærk at A skal ændres tilbage til basisvørdien.
Solve model1 USING CNS;
parameter output3(objekter,eksperiment);
output3('Y','baseline')= Y.l;
output3('w','baseline')= w.l;
output3('L','baseline')= L.l;
output3('C','baseline')= C.l;
output3('p','baseline')= P.l;
output3('N_bar','baseline')= N_bar.l;
output3('A','baseline')= A.l;
display output3;


*=== Export to Excel using GDX utilities

*=== First unload to GDX file (occurs during execution phase)
execute_unload "C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model1.gdx", output,output2, output3;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model1.xlsx par= output rng=ARK_navn!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model1.xlsx par= output2 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model1.gdx O=C:\Users\45238\Desktop\OEM\Opgavesaet\Opgavesaet_2\solve_model1.xlsx par= output3 rng=ARK_navn3!A1';
