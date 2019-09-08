#!/bin/bash -xe

$SERV_NAME=$1

sudo rm /etc/my.cnf
sudo rm /etc/nginx/nginx.conf

sudo ln -s /home/isucon/$SERV_NAME/etc/my.cnf /etc/my.cnf
sudo ln -s /home/isucon/$SERV_NAME/etc/nginx.conf /etc/nginx.conf
