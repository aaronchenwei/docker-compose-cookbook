#!/usr/bin/env bash

set -x

ZNODE="/initialized-$clusterName"

bin/watch-znode.py -z $zkServers -p / -w

bin/watch-znode.py -z $zkServers -p $ZNODE -e
if [ $? != 0 ]; then
    echo Initializing cluster
    bin/apply-config-from-env.py conf/bookkeeper.conf &&
        bin/pulsar initialize-cluster-metadata --cluster $clusterName --zookeeper $zkServers \
                   --configuration-store $configurationStore --web-service-url http://$pulsarNode:8080/ \
                   --broker-service-url pulsar://$pulsarNode:6650/ &&
        bin/watch-znode.py -z $zkServers -p $ZNODE -c
    echo Initialized
else
    echo Already Initialized
fi
