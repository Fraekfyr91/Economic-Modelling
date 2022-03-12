$onMultiR
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\Hjemmeopgave_4_2_model
$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\IOdata42a.gms



* Eksogene parametre
theta.fx(j) = 1;
Ey.fx(j) = 0.7;
Ec.fx(j) = 0.5;
Em.fx(j) = 0.5;


*Antagelse
p.l(j) = 1;
pM.l(j) = 1;
w.fx = 1;
pC.l = 1;


* Initialisering
loop(ou,
L.l(j)  $(ord(j)=ord(ou)) = IO('Lon', ou);
M.l(j)  $(ord(j)=ord(ou)) = sum(in,IO(in, ou)$(ord(in) lt 6 and ord(ou) lt 6));
);

loop(in,
C.l(j)  $(ord(j)=ord(in))= IO(in, 'PF');
Y.l(j)  $(ord(j)=ord(in))= sum(ou, IO(in, ou));
);


loop(in,
loop(ou,
x.l(i,j)$(ord(i)=ord(in) and ord(j)=ord(ou)) = IO(in,ou);
);
);

YD.l= sum(j, p.l(j)*C.l(j));



* Kalibrering

N.fx = Yd.l/w.l;
gamma.fx(j) = C.l(j)*(pC.l/p.l(j))**(-Ec.l(j))*(pC.l/YD.l);
muYL.fx(j) = ((theta.l(j)*L.l(j))/Y.l(j))*((p.l(j)*theta.l(j))/w.l)**(-Ey.l(j));
muYM.fx(j) = M.l(j)/Y.l(j);
muX.fx(i,j) = x.l(i,j)/M.l(j);


set objekter /
Y
L
M
x
C
YD
N
theta
muYL
muYM
muX
w
p
pM
pC
Ey
Em
Ec
gamma/;


solve reform using cns;
parameter base(objekter, j);
base('Y', j) = Y.l(j);
base('L', j) = L.l(j);
base('M', j) = M.l(j);
base('x', j) = sum(i, x.l(i,j));
base('C', j) = C.l(j);
base('YD', j) = YD.l;
base('N', j) = N.l;
base('theta', j) = theta.l(j);
base('muYL', j) = muYL.l(j);
base('muYM', j) = muYM.l(j);
base('muX', j) = sum(i, muX.l(i,j));
base('w', j) = w.l;
base('p', j) = p.l(j);
base('pM', j) = pM.l(j);
base('Pc', j) = Pc.l;
base('Ey', j) = Ey.l(j);
base('Em', j) = Em.l(j);
base('Ec', j) = Ec.l(j);
base('gamma', j) = gamma.l(j);
display base;
$exit
*Lad produktiviteten for sektor 1 stige med 10 procent
theta.fx('1') = theta.l('1') *1.1;

solve reform using cns;
parameter shock1(objekter, j);
shock1('Y', j) = Y.l(j);
shock1('L', j) = L.l(j);
shock1('M', j) = M.l(j);
shock1('x', j) = sum(i, x.l(i,j));
shock1('C', j) = C.l(j);
shock1('YD', j) = YD.l;
shock1('N', j) = N.l;
shock1('theta', j) = theta.l(j);
shock1('muYL', j) = muYL.l(j);
shock1('muYM', j) = muYM.l(j);
shock1('muX', j) = sum(i, muX.l(i,j));
shock1('w', j) = w.l;
shock1('p', j) = p.l(j);
shock1('pM', j) = pM.l(j);
shock1('Pc', j) = Pc.l;
shock1('Ey', j) = Ey.l(j);
shock1('Em', j) = Em.l(j);
shock1('Ec', j) = Ec.l(j);
shock1('gamma', j) = gamma.l(j);
display shock1;


*Antag nu at forbrugselasticiteten Ec = 2
*og lad igen produktiviteten for sektor 1 stige med 10 procent.


Ec.fx(j) = 2;

solve reform using cns;
parameter shock2(objekter, j);
shock2('Y', j) = Y.l(j);
shock2('L', j) = L.l(j);
shock2('M', j) = M.l(j);
shock2('x', j) = sum(i, x.l(i,j));
shock2('C', j) = C.l(j);
shock2('YD', j) = YD.l;
shock2('N', j) = N.l;
shock2('theta', j) = theta.l(j);
shock2('muYL', j) = muYL.l(j);
shock2('muYM', j) = muYM.l(j);
shock2('muX', j) = sum(i, muX.l(i,j));
shock2('w', j) = w.l;
shock2('p', j) = p.l(j);
shock2('pM', j) = pM.l(j);
shock2('Pc', j) = Pc.l;
shock2('Ey', j) = Ey.l(j);
shock2('Em', j) = Em.l(j);
shock2('Ec', j) = Ec.l(j);
shock2('gamma', j) = gamma.l(j);
display shock2;


Ec.fx(j) = 1.6459;

solve reform using cns;
parameter shock3(objekter, j);
shock3('Y', j) = Y.l(j);
shock3('L', j) = L.l(j);
shock3('M', j) = M.l(j);
shock3('x', j) = sum(i, x.l(i,j));
shock3('C', j) = C.l(j);
shock3('YD', j) = YD.l;
shock3('N', j) = N.l;
shock3('theta', j) = theta.l(j);
shock3('muYL', j) = muYL.l(j);
shock3('muYM', j) = muYM.l(j);
shock3('muX', j) = sum(i, muX.l(i,j));
shock3('w', j) = w.l;
shock3('p', j) = p.l(j);
shock3('pM', j) = pM.l(j);
shock3('Pc', j) = Pc.l;
shock3('Ey', j) = Ey.l(j);
shock3('Em', j) = Em.l(j);
shock3('Ec', j) = Ec.l(j);
shock3('gamma', j) = gamma.l(j);
display shock3;



***
*DEL 4.2c
***
*------------------------------------------------------------------------*
* Data
*------------------------------------------------------------------------*
$onMultiR

$include C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\IOdata42a.gms



* Eksogene parametre
theta.fx(j) = 1;
Ey.fx(j) = 0.7;
Ec.fx(j) = 0.5;
Em.fx(j) = 0.5;


*Antagelse
p.l(j) = 1;
pM.l(j) = 1;
w.fx = 1;
pC.l = 1;


* Initialisering
loop(ou,
L.l(j)  $(ord(j)=ord(ou)) = IO('Lon', ou);
M.l(j)  $(ord(j)=ord(ou)) = sum(in,IO(in, ou)$(ord(in) lt 6 and ord(ou) lt 6));
);

loop(in,
C.l(j)  $(ord(j)=ord(in))= IO(in, 'PF');
Y.l(j)  $(ord(j)=ord(in))= sum(ou, IO(in, ou));
);


loop(in,
loop(ou,
x.l(i,j)$(ord(i)=ord(in) and ord(j)=ord(ou)) = IO(in,ou);
);
);

YD.l= sum(j, p.l(j)*C.l(j));



* Kalibrering

N.fx = Yd.l/w.l;
gamma.fx(j) = C.l(j)*(pC.l/p.l(j))**(-Ec.l(j))*(pC.l/YD.l);
muYL.fx(j) = ((theta.l(j)*L.l(j))/Y.l(j))*((p.l(j)*theta.l(j))/w.l)**(-Ey.l(j));
muYM.fx(j) = M.l(j)/Y.l(j);
muX.fx(i,j) = x.l(i,j)/M.l(j);


solve reform using cns;
parameter base2(objekter, j);
base2('Y', j) = Y.l(j);
base2('L', j) = L.l(j);
base2('M', j) = M.l(j);
base2('x', j) = sum(i, x.l(i,j));
base2('C', j) = C.l(j);
base2('YD', j) = YD.l;
base2('N', j) = N.l;
base2('theta', j) = theta.l(j);
base2('muYL', j) = muYL.l(j);
base2('muYM', j) = muYM.l(j);
base2('muX', j) = sum(i, muX.l(i,j));
base2('w', j) = w.l;
base2('p', j) = p.l(j);
base2('pM', j) = pM.l(j);
base2('Pc', j) = Pc.l;
base2('Ey', j) = Ey.l(j);
base2('Em', j) = Em.l(j);
base2('Ec', j) = Ec.l(j);
base2('gamma', j) = gamma.l(j);
display base2;

*Lad produktiviteten for sektor 1 stige med 10 procent
theta.fx('1') = theta.l('1') *1.1;

solve reform using cns;
parameter shock4(objekter, j);
shock4('Y', j) = Y.l(j);
shock4('L', j) = L.l(j);
shock4('M', j) = M.l(j);
shock4('x', j) = sum(i, x.l(i,j));
shock4('C', j) = C.l(j);
shock4('YD', j) = YD.l;
shock4('N', j) = N.l;
shock4('theta', j) = theta.l(j);
shock4('muYL', j) = muYL.l(j);
shock4('muYM', j) = muYM.l(j);
shock4('muX', j) = sum(i, muX.l(i,j));
shock4('w', j) = w.l;
shock4('p', j) = p.l(j);
shock4('pM', j) = pM.l(j);
shock4('Pc', j) = Pc.l;
shock4('Ey', j) = Ey.l(j);
shock4('Em', j) = Em.l(j);
shock4('Ec', j) = Ec.l(j);
shock4('gamma', j) = gamma.l(j);
display shock4;

*Antag nu at forbrugselasticiteten Ec = 2
*og lad igen produktiviteten for sektor 1 stige med 10 procent.
theta.fx('1') = theta.l('1') / 1.1;
theta.fx('4') = theta.l('4') * 1.05;
theta.fx('5') = theta.l('5') * 1.05;
solve reform using cns;
parameter shock5(objekter, j);
shock5('Y', j) = Y.l(j);
shock5('L', j) = L.l(j);
shock5('M', j) = M.l(j);
shock5('x', j) = sum(i, x.l(i,j));
shock5('C', j) = C.l(j);
shock5('YD', j) = YD.l;
shock5('N', j) = N.l;
shock5('theta', j) = theta.l(j);
shock5('muYL', j) = muYL.l(j);
shock5('muYM', j) = muYM.l(j);
shock5('muX', j) = sum(i, muX.l(i,j));
shock5('w', j) = w.l;
shock5('p', j) = p.l(j);
shock5('pM', j) = pM.l(j);
shock5('Pc', j) = Pc.l;
shock5('Ey', j) = Ey.l(j);
shock5('Em', j) = Em.l(j);
shock5('Ec', j) = Ec.l(j);
shock5('gamma', j) = gamma.l(j);
display shock5;




*=== First unload to GDX file (occurs during execution phase)
execute_unload "C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx", base, shock1, shock2,shock3,base2,shock4, shock5;

*=== Now write to variable levels to Excel file from GDX 
*=== Since we do not specify a sheet, data is placed in first sheet
execute 'gdxxrw.exe I="C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx" O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.xlsx par = base rng=ARK_navn!A1';
execute 'gdxxrw.exe I="C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx" O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.xlsx par = shock1 rng=ARK_navn2!A1';
execute 'gdxxrw.exe I="C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx" O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.xlsx par = shock2 rng=ARK_navn3!A1';
execute 'gdxxrw.exe I="C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx" O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.xlsx par = shock3 rng=ARK_navn4!A1';

execute 'gdxxrw.exe I="C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx" O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.xlsx par = base2 rng=ARK_navn5!A1';
execute 'gdxxrw.exe I="C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx" O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.xlsx par = shock4 rng=ARK_navn6!A1';
execute 'gdxxrw.exe I="C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.gdx" O=C:\Users\45238\Desktop\OEM\Hjemmeopgaver\Hjemmeopgave_4\model2.xlsx par = shock5 rng=ARK_navn7!A1';

