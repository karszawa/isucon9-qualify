#!/bin/bash -xe

HOST_NAME=$1

scp ~/.ssh/isu9q     $HOST_NAME:/home/isucon/.ssh/
scp ~/.ssh/isu9q.pub $HOST_NAME:/home/isucon/.ssh/
scp ./gitconfig $HOST_NAME:/home/isucon/.gitconfig
scp ./sshconfig $HOST_NAME:/home/isucon/.ssh/config
ssh $HOST_NAME "chmod 600 ~/.ssh/isu9q"
