*-----------------------------------------------------
* Hjemmeopgave 1
*-----------------------------------------------------
$Title Lille åben økonomi

*suppressing output
$offsymxref offsymlist
option limcol =0, limrow=0;
option solprint=off;

*--------------------------------


***Opstiller modellerne***

set u /f, c/;
parameter
gamma(u) vægte
N befolkning
A teknologi
E substitutionselasticitet
phi udenlandsk efterspørgsel
Ex eksportelasticitet
w0 basisløn
N0 basisbefolkning
Pi0 basis prisindeks;
*Definer variable
variables
L arbejdskraft
Y produktion
p(u) pris
w løn
C(u) forbrug
Pi prisindeks
X eksport;

*Definerer lignings navne     
equations
e_1 arbejdskraft 
e_2 nul-profit
e_3 arbejdsmarked ligevægt
e_4 varemarkedet ligevægt
e_5(u) forbrug
e_6 budgetrestriktion
e_7 prisniveau
e_8 hekscher-ohlin
e_9 armington;

*Angiver ligninger
e_1.. L =e= (1/A)*Y;
e_2.. p('c')*Y =e= w*L;
e_3.. L =e= N;
e_4.. Y =e= C('c')+X;
e_5(u).. C(u) =e= gamma(u)*(p(u)/Pi)**(-E)*((w*N)/Pi);
e_6.. w*N =e= sum(u, p(u)*C(u));
e_7.. p('f') =e= 1;
e_8.. p('c') =e= p('f');
e_9.. X =e= phi*(p('c')/p('f'))**(-Ex);

*Definerer mdellerne
model HO_luk /e_1, e_2, e_3, e_4, e_5, e_6, e_7, e_8/; 
model AR_luk /e_1, e_2, e_3, e_4, e_5, e_6, e_7, e_9/;
