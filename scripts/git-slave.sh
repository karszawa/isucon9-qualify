#!/bin/bash -xe

. ./git-common.sh

HOST_NAME=$1
SERV_NAME=$2

ssh $HOST_NAME <<EOF
rm -rf $SERV_NAME
git clone git@github.com:karszawa/isucon9-qualify.git $SERV_NAME
EOF
