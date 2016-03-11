#!/usr/bin/env bash

# Source pulled from public netz here:
# https://gist.github.com/will-ob/2d625ba1ea092be0c129
# Included in  this repository for reference / source control

source /etc/environment
# If I am able to contact etcd2
/usr/bin/etcdctl mkdir /consul/leader

if [[ $? -eq 0 ]]; then
  echo "Master lock created, bootstrapping"

  /bin/bash -c "/usr/bin/docker run \
    --net=host gliderlabs/consul-server:0.6 \
    -server \
    -bootstrap \
    -advertise $COREOS_PRIVATE_IPV4"

else
  echo "Could not create master lock, assume follower"

  joins="$(/usr/bin/etcdctl members list \
            | etcdctl member list \
            | awk '{ print $3 }' \
            | sed 's/peerURLs=//g' \
            | sed 's/,\?http:\/\//-retry-join /g' \
            | sed 's/:2380/ \\/g')"

  /bin/bash -c "/usr/bin/docker run \
    --net=host gliderlabs/consul-server:0.6 \
    -server \
    $joins
    -advertise $COREOS_PRIVATE_IPV4"

fi
