#! /bin/bash


cd Challange


#creation de dossier administrators


mkdir administrators
chmod 750 administrators
setfacl -R -m u:Bob:rwx administrators
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


cd ..





mkdir Charlie
chmod 700 Charlie
cd Charlie
mkdir Desktop
mkdir Desktop/Emails
mkdir Desktop/Files
cd Desktop/Emails

cat <<EOF > req_new.eml
From: David <David@INSA.com>
To: Charlie <Charlie@INSA.com>
Subject: Message D'accueill
Date: Mon, 20 Sep 2025 09:00:00 +0000
Message-ID: <14119>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

Hi Charlie,

Bienvenue dans notre entreprise. Je suis David, PDG.

Si vous avez besoin de moi, vous pouvez entrer dans mon bureau à tout moment.
Veuillez utiliser le mot de passe A405012 pour ouvrir la porte d'accès à mon bureau.

Cordialement,
David
EOF
