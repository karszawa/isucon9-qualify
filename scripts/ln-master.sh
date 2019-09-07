#!/bin/bash -xe

$SERV_NAME=$1

mv /etc/my.cnf /home/isucon/$SERV_NAME/etc/my.cnf
ln -s /home/isucon/$SERV_NAME/etc/my.cnf /etc/my.cnf

mv /var/log/nginx/access.log /home/isucon/$SERV_NAME/logs/isu9q-01-access.log
ln -s /var/log/nginx/access.log /home/isucon/$SERV_NAME/logs/isu9q-01-access.log
