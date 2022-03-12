
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


