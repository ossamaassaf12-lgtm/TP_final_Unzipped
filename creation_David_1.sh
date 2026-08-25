
#! /bin/bash
VBoxManage snapshot PentestBase-Ubuntu2404 take "baseline-clean" --description "Ubuntu LTS + full pentest toolset"
sudo -u auditor VBoxManage registervm /srv/vm-templates/PentestBase-Ubuntu2404/PentestBase-Ubuntu2404.vbox

cd Challange
mkdir David
chmod 700 David
cd David

mkdir Desktop
mkdir Desktop/Emails

cat <<'EOF' > Validator.sh
#!/bin/bash

read -p "Do you want to validate? (yes/no): " answer

if [[ "${answer,,}" == "yes" ]]; then
    echo "You chose YES. Continuing..."
    echo "this is flag RM{INSA-LYON-Systeme}"
else
    echo "Not validated."
fi
EOF



chmod +x Validator.sh
