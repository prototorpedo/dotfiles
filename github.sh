ssh-keygen -t ed25519 -C "calin.s.bogdan@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
