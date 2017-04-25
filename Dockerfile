FROM ubuntu:latest
MAINTAINER Romain Aviolat <r.aviolat@gmail.com>

RUN apt-get update && apt-get install -y --force-yes curl dnsutils ssh

RUN mkdir /keys
ADD update.sh /update.sh
RUN chmod +x /update.sh

ENTRYPOINT ["/update.sh"]

