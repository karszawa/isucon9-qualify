#!/bin/bash -xe

set -u
readonly SERV_NAME=hoge
readonly services="mariadb isucari.golang h2o netdata"
readonly instances=$@
readonly isucon_dir=/home/isucon

for instance in ${instances}; do
  ssh $instance <<EOS
    if [[ ! -d ${isucon_dir}/$SERV_NAME ]]; then
      echo "No file ${isucon_dir}/$SERV_NAME" 2>&1
      exit 1
    fi

    cd ${isucon_dir}/$SERV_NAME/webapp/go

    make

    for service in ${services}; do
      systemctl restart $service.service
      systemctl status $service.service
    done
EOS
done

echo "Finished restart!"
