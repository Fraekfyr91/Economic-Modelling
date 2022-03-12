* Opgavsæt 3.1
*Opgave 3.1.1 Verdens næstsimpleste ligevægtsmodel
* Setter til type 1 og 2
set j "type af arbejdskraft" /1,2/;

* Parameteren E defineres
parameter E " Elasticiteten";

*definer variable
variables
*Endogene
*--------------------------------------
Y "Output (Endogen)"
L(j) "Arbejdskraft (Endogen)"
C "Vareforbrug (Endogen)"
w(j) "Løn for j type uddannet (Endogen)"
p "Pris (Endogen)"
* Eksogene
*--------------------------------------
N(j) "Befolkningen (Eksogen)"
mu(j) "efterspørgsels parameter for type j (eksogen)"
*************
*Til model 2*
*************
rho(j) "Produktivitet  (Eksogen)";
;
* Ligningerne defineres
Equations
E_L(j) 
E_Y 
E_N(j) 
E_C 
E_P 
;

* 3.1.2 Opstil ligningene og definer modellen
*"Efterspørgsel efter arbejdskraftstype j"
E_L(j).. L(j) =e= mu(j)*(w(j)/p)**(-E)*Y;
*"Nul-profit betingelse"
E_Y.. p*Y =e= sum(j, w(j)*L(j));
*"Ligevægt på arbejdsmarkedet for type j"
E_N(j).. L(j)=e= N(j);
*"Privat forbrug"
E_C.. C =e= 1/p*sum(j,w(j)*N(j));
*" pris"
E_P.. p =e= 1

*Opstiller modellen
Model model1/
E_L
E_Y
E_N
E_C
E_P/;

************
*Model 2
************

Equations
E_Y2(j)
E_W2
E_L2(j)
E_C2
E_p2;


*------------------------------------------------------------------------*
* Opgave 3.2.2
* Opstil ligningerne og definer modellen
*------------------------------------------------------------------------*

E_Y2(j)..     L(j) =e= mu(j) * (w(j)/p)**(-E) * Y;
E_W2..        p*Y  =e= sum(j,w(j)*L(j));
E_L2(j)..     L(j) =e= rho(j)*N(j);
E_C2..        C    =e= sum(j,rho(j)*w(j)*N(j)) / p;
E_p2..        p    =e= 1;

model model2/
E_Y2
E_W2
E_L2
E_C2
E_p2/;