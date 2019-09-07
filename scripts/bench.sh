#!/bin/bash -xe

HOST_NAME=$1
SERV_NAME=$2

ssh $HOST_NAME "
  cd /home/isucon/$SERVICE_NAME
  : > logs/isu9q-01-access.log
"

read -p "Trigger bench from isucon portal and please press ENTER if the bench is finished -> "

ssh isu9q-01 <<EOS
  cd /home/isucon/$SERV_NAME
  git pull
  git add logs/isu9q-01-access.log
  git commit -m "update access log - `date +%R`"
  git push
EOS
