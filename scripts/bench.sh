#!/bin/bash -xe

SERVICE_NAME=torb

ssh isu9q-01 "
  cd /home/isucon/$SERVICE_NAME
  : > logs/isuq9-01-access.log
"

read -p "Trigger bench from isucon portal and please press ENTER if the bench is finished -> "

ssh isu9q-01 "
  cd /home/isucon/$SERVICE_NAME
  git pull
  git add logs/isucon-q9-01-access.log
  git commit -m "update access log - `date +%R`"
  git push
"
