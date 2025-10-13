#! /bin/bash


# Creation De Groupes

sudo groupadd developpeur
sudo groupadd administration
sudo groupadd CEO


# Creation d'Utilisateurs

sudo useradd -m -s /bin/bash -G developpeur alice
sudo useradd -m -s /bin/bash -G developpeur,administration Bob
sudo useradd -m -s /bin/bash -G administration Charlie
sudo useradd -m -s /bin/bash -G CEO


 # Set Passwords
echo "alice:8080GrandePass" | sudo chpasswd
echo "Bob:Bob@@@123321" | sudo chpasswd
echo "Charlie:1223334444" | sudo chpasswd
echo "David:A405012" | sudo chpasswd



mkdir Challange
chmod 777 Challange

cd Challange

#creation de dossier administrators


mkdir administrators
chmod 700 administrators
cd administrators
echo 'ÏÏÿÿÿÿÿÿÿÿBiff8 ÿÿÿÿÿÿÿÿÿÿÿÿÿÿ ÿÿÿÿ ÿÿÿÿÿÿÿÿÿÿ ÿÿÿÿ
Workbook   .........................._VBA_PROJECT_CUR  ..........data.....     ........
..Þ.._...É...f..d.C.B...R...k...#..ë...........biff8...Excel.Sheet.8.............
................... ÿÿÿÿÿÿÿÿÿÿ...ÿÿ..œ.... ƒ.„.›...†.Ú.......................

nameÏÏÿÿÿDepartmentÏÏÿÿÿOTP
ÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿ
BobÏÏÿÿÿadminstratorÏÏÿÿÿ1245678
CharlieÏÏÿÿÿadminstratorÏÏÿÿÿ1223334444
ÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿ
ÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿ
ÏÏÿÿÿ
ÏÏÿÿÿ
ÏÏÿÿÿ
ÏÏÿÿÿ
ÏÏÿÿÿ
ÏÏÿÿÿ
ÏÏÿÿÿ
ÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿ
ÏÏÿÿÿ ' > administrators.xls


chmod 755 administrators.xls
 





