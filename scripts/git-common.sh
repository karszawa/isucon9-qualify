#!/bin/bash

scp -i ~/.ssh/isu9q ~/.ssh/isu9q     isucon@$1:/home/isucon/.ssh/
scp -i ~/.ssh/isu9q ~/.ssh/isu9q.pub isucon@$1:/home/isucon/.ssh/
ssh -i ~/.ssh/isu9q isucon@$1 "chmod 600 ~/.ssh/isu9q"
scp -i ~/.ssh/isu9q ./gitconfig isucon@$1:/home/isucon/.gitconfig
scp -i ~/.ssh/isu9q ./sshconfig isucon@$1:/home/isucon/.ssh/config
