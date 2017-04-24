FROM ubuntu:latest
MAINTAINER Romain Aviolat <r.aviolat@gmail.com>

RUN apt-get update && apt-get install -y --force-yes curl dnsutils ssh

ENV arecord=test.domain.com
ENV authoritative=domain.com
ENV user=myuser
ENV remoteip=xxx.xxx.xxx.xxx
ENV remotecommand=/home/user/mycommand

RUN mkdir /keys
ADD id_rsa /keys/id_rsa
ADD id_rsa.pub /keys/id_rsa.pub
ADD update.sh /update.sh
RUN chmod 700 /id_rsa
RUN chmod 700 /id_rsa.pub

ENTRYPOINT ["/update.sh"]

