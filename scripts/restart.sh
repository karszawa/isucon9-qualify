#!/bin/bash -xe

readonly SERV_NAME=isucari
readonly services="isucari.golang nginx netdata"
readonly branch=$1
shift
readonly instances=$@
readonly isucon_dir=/home/isucon

for instance in ${instances}; do
  ssh $instance <<EOS
    if [[ ! -d ${isucon_dir}/$SERV_NAME ]]; then
      echo "No file ${isucon_dir}/$SERV_NAME" 2>&1
      exit 1
    fi

    cd ${isucon_dir}/$SERV_NAME

    git fetch
    git checkout ${branch:-master}
    git pull

    cd ${isucon_dir}/$SERV_NAME/webapp/go

    make

    sudo systemctl restart isucari.golang.service
    systemctl status isucari.golang.service

    sudo systemctl restart nginx.service
    systemctl status nginx.service

    sudo systemctl restart netdata.service
    systemctl status netdata.service

    cd ${isucon_dir}/$SERV_NAME
    curl -XPOST http://127.0.0.1:8000/initialize -H 'Content-Type: application/json' -d @initialize.json
EOS
done

echo "Finished restart!"
