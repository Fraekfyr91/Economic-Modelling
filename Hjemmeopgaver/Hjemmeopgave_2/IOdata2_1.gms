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
M     0     0    200   0     0
Afg   0     0    0     0     0
Lon   700   300  0     0     0
;

