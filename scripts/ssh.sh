#!/bin/bash -xe
# !DEPRECATED!

ssh-add -K ~/.ssh/isu9q

addrs=()

for i in {1..3}; do
  read -p "Please tell me isu9q-0$i address: " addr
  addrs+=(addr)
done

echo "OK! Then copy  the followingsettings to your ~/.ssh/config"

for i in {1..3}; do
  echo "
Host isu9q-0$i
  HostName $addrs[$i]
  User root
  Port 22
  IdentityFile ~/.ssh/isu9q
"
done
