Sets
q "Input" /
PS   "Privat sektor"
Lon1  "Lonsum1"
Lon2  "Lonsum2"
Rest "restindkomst"
/
o "Output" /
PS   "Privat sektor"
C    "forbrug"
I    "Investeringer" /
;
Table IO(q,o) "Input-output-tabel"
        PS     C    I
PS       0   800  200
lon1   600     0    0
lon2   100     0    0
Rest   300     0    0
;

parameter
bef(j) "arbejdsstyrke med uddannelsestype j"
;
bef('1') = 1600;
bef('2') = 125;
