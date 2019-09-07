#!/bin/bash -xe

$SERV_NAME=$1

rm /etc/my.cnf
ln -s /home/isucon/$SERV_NAME/etc/my.cnf /etc/my.cnf
