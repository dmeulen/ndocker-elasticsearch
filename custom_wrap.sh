#!/bin/bash -x

env

export CONSUL_ES_SERVICE

coproc /usr/local/bin/consul-template \
  -consul-addr "consul.service.consul:8500" \
  -template "/unicast_hosts.tpl:/usr/share/elasticsearch/config/unicast_hosts.txt:true"

exec /usr/local/bin/docker-entrypoint.sh
