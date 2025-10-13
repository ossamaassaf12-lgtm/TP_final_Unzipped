#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

LOG=/tmp/setup_ctf.log
echo "Starting CTF setup at $(date)" | tee "$LOG"

ensure_root() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root: sudo $0" | tee -a "$LOG"
    exit 1
  fi
}

safe_mkdir() {
  local d="$1"
  mkdir -p "$d"
  echo "mkdir -p $d" >> "$LOG"
}

create_groups_and_users() {
  echo "==> Creating groups..." | tee -a "$LOG"
  for g in developpeur administration CEO; do
    if ! getent group "$g" >/dev/null; then
      groupadd "$g"
      echo "groupadd $g" >> "$LOG"
    else
      echo "group $g exists" >> "$LOG"
    fi
  done

  echo "==> Creating users..." | tee -a "$LOG"
  id alice >/dev/null 2>&1 || useradd -m -s /bin/bash -G developpeur alice
  id Bob >/dev/null 2>&1 || useradd -m -s /bin/bash -G developpeur,administration Bob
  id Charlie >/dev/null 2>&1 || useradd -m -s /bin/bash -G administration Charlie
  id David >/dev/null 2>&1 || useradd -m -s /bin/bash -G CEO David

  echo "==> Setting passwords..." | tee -a "$LOG"
  echo "alice:8080GrandePass" | chpasswd
  echo "Bob:Bob@@@123321" | chpasswd
  echo "Charlie:1223334444" | chpasswd
  echo "David:A405012" | chpasswd
}

create_structure_and_files() {
  BASE="$(pwd)"
  CTF_DIR="$BASE/Challange"

  echo "==> Creating Challange directory at $CTF_DIR" | tee -a "$LOG"
  safe_mkdir "$CTF_DIR"
  chmod 777 "$CTF_DIR"

  # ---------------------
  # administrators folder
  # ---------------------
  echo "==> Creating administrators folder and administrators.xls" | tee -a "$LOG"
  safe_mkdir "$CTF_DIR/administrators"
  chmod 750 "$CTF_DIR/administrators"

  # administrators.xls with jumbled content
  cat > "$CTF_DIR/administrators/administrators.xls" <<'EOF'
ÏÏÿÿÿÿÿÿÿÿBiff8 ÿÿÿÿÿÿÿÿÿÿÿÿÿÿ ÿÿÿÿ ÿÿÿÿÿÿÿÿÿÿ ÿÿÿÿ
Workbook   .........................._VBA_PROJECT_CUR  ..........data.....     ........
..Þ.._...É...f..d.C.B...R...k...#..ë...........biff8...Excel.Sheet.8.................
................... ÿÿÿÿÿÿÿÿÿÿ...ÿÿ..œ.... ƒ.„.›...†.Ú........................

nameÏÏÿÿÿDepartmentÏÏÿÿÿOTP
ÏÏÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿ
BobÏÏÿÿadminstratorÏÏÿÿÿ1245678
CharlieÏÏÿÿadminstratorÏÏÿÿÿ1223334444
ÏÏÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿ
ÏÏÿÿÏÏÿÿÿÏÏÿÿÿ
ÏÏÿÿ
ÏÏÿÿ
ÏÏÿÿ
ÏÏÿÿ
ÏÏÿÿ
ÏÏÿÿ
ÏÏÿÿ
ÏÏÿÿ
ÏÏÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿÏÏÿÿÿ
ÏÏÿÿ
EOF

  # Set ownership to Charlie
  chown -R Charlie:administration "$CTF_DIR/administrators"
  echo "chown -R Charlie:administration $CTF_DIR/administrators" >> "$LOG"

  # Give Bob ACL rwx on administrators if setfacl exists
  if command -v setfacl >/dev/null 2>&1; then
    setfacl -R -m u:Bob:rwx "$CTF_DIR/administrators"
    echo "setfacl -R -m u:Bob:rwx $CTF_DIR/administrators" >> "$LOG"
  else
    echo "Warning: setfacl not installed, skipping ACL setup for Bob" | tee -a "$LOG"
  fi

  # ---------------------
  # Alice
  # ---------------------
  echo "==> Creating Alice files" | tee -a "$LOG"
  safe_mkdir "$CTF_DIR/alice/Desktop/Emails"
  safe_mkdir "$CTF_DIR/alice/Desktop/Projet"
  chmod 700 "$CTF_DIR/alice"
  chown -R alice:developpeur "$CTF_DIR/alice"

  echo "si le PDG David ne le valide pas , je le validerai moi-meme" > "$CTF_DIR/alice/note.txt"
  echo "console.log('Hello JS');" > "$CTF_DIR/alice/Desktop/Projet/hello.js"
  echo "<?php echo 'Hello PHP'; ?>" > "$CTF_DIR/alice/Desktop/Projet/hello.php"

  cat > "$CTF_DIR/alice/Desktop/Emails/Req_1.eml" <<'EOF'
From: Alice <alice@INSA.com>
To: Bob <bob@INSA.com>
Subject: Augmentation_Req
Date: Tue, 24 Sep 2025 09:30:00 +0000
Message-ID: <msg1@example.com>

Hi Bob,

je me demande si notre PDG, David a validé mon augmentation ou non.
Cordialement, Alice
EOF

  cat > "$CTF_DIR/alice/Desktop/Emails/Req_2.eml" <<'EOF'
From: Bob <Bob@INSA.com>
To: Alice <Alice@INSA.com>
Subject: Augmentation_Req
Date: Tue, 24 Sep 2025 10:30:00 +0000
Message-ID: <msg2@example.com>

Hi Alice
je ne sais pas encore , merci de ne pas contacter David directement
Vous n'avez acces a David que par mon intermedaire
Cordialement,
Bob
EOF

  cat > "$CTF_DIR/alice/Desktop/Emails/Req_3.eml" <<'EOF'
From: Bob <Bob@INSA.com>
To: Alice <Alice@INSA.com>
Subject: Projet_Dev
Date: Tue, 24 Sep 2025 12:30:00 +0000
Message-ID: <msg3@example.com>

Hi Alice
Concernant le projet Dev , Voici les Identifiant du compte 
username: Paris_Proj
Password : Bob@@@123321
Ne partagez ce mot de passe avec personne , cela signifie beaucoup pour moi
Cordialement,
Bob
EOF

  chown -R alice:developpeur "$CTF_DIR/alice"

  # ---------------------
  # Bob
  # ---------------------
  echo "==> Creating Bob files" | tee -a "$LOG"
  safe_mkdir "$CTF_DIR/Bob/Desktop"
  chmod 700 "$CTF_DIR/Bob"
  chown -R Bob:developpeur "$CTF_DIR/Bob"

  cat > "$CTF_DIR/Bob/Desktop/note.txt" <<'EOF'
Message de motivation

En tant qu'administrateur, je peux repousser toutes les limites et créer mes propres limites.
Je dois gagner le nouvel administrateur Charlie
BOB
EOF

  # ---------------------
  # Charlie
  # ---------------------
  echo "==> Creating Charlie files" | tee -a "$LOG"
  safe_mkdir "$CTF_DIR/Charlie/Desktop/Emails"
  safe_mkdir "$CTF_DIR/Charlie/Desktop/Files"
  chmod 700 "$CTF_DIR/Charlie"
  chown -R Charlie:administration "$CTF_DIR/Charlie"

  cat > "$CTF_DIR/Charlie/Desktop/Emails/req_new.eml" <<'EOF'
From: David <David@INSA.com>
To: Charlie <Charlie@INSA.com>
Subject: Message D'accueil
Date: Mon, 20 Sep 2025 09:00:00 +0000
Message-ID: <14119>

Hi Charlie,

Bienvenue dans notre entreprise. Je suis David, PDG.

Si vous avez besoin de moi, vous pouvez entrer dans mon bureau à tout moment.
Veuillez utiliser le mot de passe A405012 pour ouvrir la porte d'accès à mon bureau.

Cordialement,
David
EOF

  # ---------------------
  # David
  # ---------------------
  echo "==> Creating David files" | tee -a "$LOG"
  safe_mkdir "$CTF_DIR/David"
  safe_mkdir "$CTF_DIR/David/Desktop"  
  chmod 700 "$CTF_DIR/David"
  chown -R David:CEO "$CTF_DIR/David"

  cat > "$CTF_DIR/David/Validator.sh" <<'EOF'
#!/bin/bash

read -p "Do you want to validate? (yes/no): " answer

if [[ "${answer,,}" == "yes" ]]; then
    echo "You chose YES. Continuing..."
    echo "this is flag RM{INSA-LYON-Systeme}"
else
    echo "Not validated."
fi
EOF

  chmod +x "$CTF_DIR/David/Validator.sh"
  chown David:CEO "$CTF_DIR/David/Validator.sh"

  echo "All files created. Ownerships and permissions set." | tee -a "$LOG"
}

main() {
  ensure_root
  create_groups_and_users
  create_structure_and_files
  echo "CTF setup completed successfully. Check $LOG for details."
}

main
