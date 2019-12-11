#!/bin/sh

start() {
    echo 'will start...'
    HOSTNAME=$(hostname) docker stack deploy -c docker-stack.yml prom
}

stop() {
    echo 'will stop...'
    docker stack rm prom
}

status() {
    echo 'status:'
    docker stack ps prom
}

select i in start stop exit
do
    case $i in
        start) start ${@:1};;
        stop) stop ${@:1};;
        status) status ${@:1};;
        exit) exit;;
    esac
done
