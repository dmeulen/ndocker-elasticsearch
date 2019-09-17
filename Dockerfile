ARG VERSION=7.3.1
FROM docker.elastic.co/elasticsearch/elasticsearch:$VERSION

ARG VERSION
ARG ES_JAVA_OPTS

COPY jvm.options /usr/share/elasticsearch/config/jvm.options
COPY custom_wrap.sh /usr/local/bin/custom_wrap.sh
COPY unicast_hosts.tpl /unicast_hosts.tpl

USER root

ENV \
  CONSUL_TEMPLATE_VERSION=0.22.0

RUN \
  curl -L https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz -o /tmp/consul-template.tgz && \
  tar xf /tmp/consul-template.tgz -C /usr/local/bin && \
  rm -f /tmp/consul-template.tgz

ENTRYPOINT /usr/local/bin/custom_wrap.sh
