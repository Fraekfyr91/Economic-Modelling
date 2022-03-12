Sets
i "Input" /
PS   "Privat sektor"
OS   "Off sektor"
M    "Import"
Afg  "Afgifter"
Lon  "Lonsum" /
o "Output" /
PS   "Privat sektor"
OS   "Off sektor"
PF   "Privat forbrug"
OF   "Off forbrug"
X    "Eksport" /
;


Table IO(i,o) "Input-output-tabel"
      PS    OS   PF    OF    X
PS    0     0    500   0     200
OS    0     0    0     300   0
M     0     0    220   0     0
Afg   0     0    72    0     0
Lon   700   300  0     0     0
;

Parameters
told
ind_skat
transf
;
* Provenuet fra told er 20 mia. kr.
told = 20;
* Provenuet fra indkomstskat er 300 mia. kr
ind_skat = 300;
* De samlede transfereringer er 100 mia. kr.
transf = 100;

