
*--------------------------------
set j /1, 2/;
set u /f, c/;

*Parametre defineres
parameter
gamma(u) vægte
N(j) befolkning
Ey produktionselasticitet
Ec forbrugselasticitet
phi udenlandsk efterspørgsel
Ex eksportelasticitet
my(j) vægte
rho(j) arbejdsmarkedsvægte
w0(j) basisløn
N0(j) basisbefolkning
rho0(j) basisbefolkning
Pi0 basis prisindeks;

variables
L(j) arbejdskraft
Y produktion
p(u) pris
w(j) løn
C(u) forbrug
Pi prisindeks
X eksport;
               
equations 
E2_1(j) arbejdskraft 
E2_2 nul-profit
E2_3(j) arbejdsmarked ligevægt
E2_4 varemarkedet ligevægt
E2_5(u) forbrug
E2_6 budgetrestriktion
E2_7 prisniveau
E2_8 hekscher-ohlin
E2_9 armington;

* Opstiller ligningene og definerer modellen

E2_1(j).. L(j) =e= my(j)*(w(j)/p('c'))**(-Ey)*Y;
E2_2.. p('c')*Y =e= sum(j, w(j)*L(j));
E2_3(j).. L(j) =e= rho(j)*N(j);
E2_4.. Y =e= C('c')+X;
E2_5(u).. C(u) =e= gamma(u)*(p(u)/Pi)**(-Ec)*(sum(j, w(j)*rho(j)*N(j))/Pi);
E2_6.. sum(j, w(j)*rho(j)*N(j)) =e= sum(u, p(u)*C(u));
E2_7.. p('f') =e= 1;
E2_8.. p('c') =e= p('f');
E2_9.. X =e= phi*(p('c')/p('f'))**(-Ex);

model HO_luk /E2_1, E2_2, E2_3, E2_4, E2_5, E2_6, E2_7, E2_8/; 
model AR_luk /E2_1, E2_2, E2_3, E2_4, E2_5, E2_6, E2_7, E2_9/;
