#!/bin/bash

ssh-keygen -t rsa -b 4096 -f ~/.ssh/isu9q
ssh-add -K ~/.ssh/isu9q

echo -e "\e[32mBackup ssh config to ~/.ssh/config.back\e[m"
cp ~/.ssh/config ~/.ssh/config.back

for i in {1..3}; do
  read -p "plz input isu9q-0$i ip address: " ipaddr

  echo "
Host isu9q-0$i
  HostName $ipaddr
  User root
  Port 22
  IdentityFile ~/.ssh/isu9q
" | cat - ~/.ssh/config > ~/.ssh/config.tmp
  mv ~/.ssh/config.tmp ~/.ssh/config
done
