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






