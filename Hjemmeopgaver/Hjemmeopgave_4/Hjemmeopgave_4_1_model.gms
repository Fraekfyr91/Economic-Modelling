$Title Hjemmeopgave 4.1


*------------------------------------------------------------------------*
*Objekter og dimensioner
*------------------------------------------------------------------------*
sets t /t0*t100/;

Variables
*Endogene variable
K(t)     "Kapital"
Y(t)     "Output"
L(t)     "Arbejdsudbud"
I(t)     "Investeringer"
C(t)     "Privatforbrug"
V(t)     "Virksomhedernes v?rdi"
uc(t)    "User-cost for kapital"
W(t)     "L?nnen"
r(t)     "Renten"
*Eksogene variable
P(t)     "Prisen i indlandet"
delta(t) "Afskrivningsraten"
theta(t) "Arbejdskraftsproduktivitet"
rho      "Risikoaversion"
eta      "Tilbagediskonteringsrate"
myK      "Produktionsv?gt kapital"
myL      "Produktionsv?gt arbejdskraft"
E        "Elasticitet i produktionsfkt"
g        "V?kst"
;



Equations
E_K(t)
E_W(t)
E_P(t)
E_uc(t)
E_I(t)
E_C(t)
E_Y(t)
E_V(t)
E_Vterm
E_ucterm
E_Cterm
;

E_K(t)    $ (ord(t) gt 1)..                         K(t-1)/(1+g)  =e= MyK * (uc(t-1)/P(t))**(-E) * Y(t);
E_W(t)    $ (ord(t) gt 1)..                         theta(t)*L(t) =e= MyL * ((W(t)/theta(t))/P(t))**(-E)*Y(t);
E_P(t)    $ (ord(t) gt 1)..                         P(t)*Y(t)     =e= (uc(t-1)*K(t-1))/(1+g) + W(t)*L(t);
E_uc(t)   $ (ord(t) lt card(t))..                   uc(t)         =e= r(t+1) + delta(t);
E_I(t)    $ (ord(t) gt 1)..                         K(t)          =e= (1-delta(t))*K(t-1)/(1+g) + I(t);
E_C(t)    $ (ord(t) gt 1 and ord(t) lt card(t))..   C(t+1)*(1+g)  =e= ((1+r(t+1))/(1+eta))**(1/rho)*C(t);
E_Y(t)    $ (ord(t) gt 1)..                         Y(t)          =e= C(t) + I(t);
E_V(t)    $ (ord(t) gt 1 and ord(t) lt card(t))..   V(t+1)*(1+g)  =e= (1+r(t+1))*V(t) - (P(t+1)*Y(t+1)*(1+g) - w(t+1)*L(t+1)*(1+g) - P(t+1)*I(t+1)*(1+g));
E_Cterm..                                           C('t100')     =e= C('t99');
E_Vterm..                                           V('t100')     =e= V('t99');
E_ucterm..                                          uc('t100')    =e= uc('t99');

Model Ramsey /ALL/;
