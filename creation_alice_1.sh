#! /bin/bash



cd Challange
mkdir alice 
chmod 700 alice
cd alice
mkdir Desktop
mkdir Desktop/Emails
mkdir Desktop/Projet
echo "si le PDG David ne le valide pas , je le validerai moi-meme" > note.txt
cd Desktop/Projet
echo "n'importe quelle javascript code" > hello.js
echo "n'importe quelle php code" > hello.php

cd ../Emails


cat <<EOF > Req_1.eml
From: Alice <alice@INSA.com>
To: Bob <bob@INSA.com>
Subject: Augmentation_Req
Date: Tue, 24 Sep 2025 09:30:00 +0000
Message-ID: <msg1@example.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bob,

je me demande si notre PDG, David a validé mon augmentation ou non.
Cordialement, Alice
EOF

cat <<EOF > Req_2.eml
From: Bob <Bob@INSA.com>
To: Alice <Alice@INSA.com>
Subject: Augmentation_Req
Date: Tue, 24 Sep 2025 10:30:00 +0000
Message-ID: <msg2@example.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Alice
je ne sais pas encore , merci de ne pas contacter David directement
Vous n'avez acces a David que par mon intermedaire
Cordialement,
Bob
EOF

cat <<EOF > Req_3.eml
From: Bob <Bob@INSA.com>
To: Alice <Alice@INSA.com>
Subject: Projet_Dev
Date: Tue, 24 Sep 2025 12:30:00 +0000
Message-ID: <msg3@example.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Alice
Concernant le projet Dev , Voici les Identifiant du compte 
username: Paris_Proj
Password : Bob@@@123321
Ne partagez ce mot de passe avec personne , cela signifie beaucoup pour moi
Cordialement,
Bob
EOF



cd ../../..


# Apres ca Continuez de lire readme.txt

