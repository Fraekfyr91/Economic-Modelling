Sets
j "Input" /
PS   "Privat sektor"
Lon  "Lonsum"
Rest "restindkomst"
/
o "Output" /
PS   "Privat sektor"
C    "forbrug"
I    "Investeringer" /
;
Table IO(j,o) "Input-output-tabel"
        PS     C    I
PS       0   800  200
lon    700     0    0
Rest   300     0    0
;