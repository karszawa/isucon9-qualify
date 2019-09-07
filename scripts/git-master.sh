#!/bin/bash -xe

. ./git-common.sh

HOST_NAME=$1

echo <<EOF
Execute following commands
1. cp -rf $SERCICE_NAME $SERVICE_NAME-default
2. git clone git@github.com:karszawa/isucon9-qualify.git tmp
3. cp -aT tmp $SERVICE_NAME
4. commit & push iikanji!
EOF

ssh $HOST_NAME
