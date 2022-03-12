Sets
i "Input" /
PS   "Privat sektor"
M    "Import"
Lon1  "Lonsum for lavt uddannede"
Lon2  "Lonsum for højt uddannede" /

o "Output" /
PS   "Privat sektor"
PF   "Privat forbrug"
X    "Eksport" /
;


Table IO(i,o) "Input-output-tabel"
      PS      PF      X
PS    0       1300    700
M     0       700     0
Lon1  500     0       0
Lon2  1500    0       0
;

Parameter
bef(j) "arbejdsstyrke med uddannelsestype j"
;

bef('1') = 500;
bef('2') = 800;

