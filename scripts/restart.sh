#!/bin/bash -xe

set -u
readonly SERV_NAME=hoge
readonly services="mariadb torb.go h2o netdata"
readonly instances=$@

for instance in ${instances}; do
  ssh $instance <<EOS
    if [[ ! -d /home/isucon/$SERV_NAME ]]; then
      echo "No file /home/isucon/$SERV_NAME" 2>&1
      exit 1
    fi 
    
    cd /home/isucon/$SERV_NAME/webapp/go

    make

    for service in ${services}; do
      systemctl restart $service.service
      systemctl status $service.service
    done
EOS
done

echo "Finished restart!"
