FROM debian:stable-slim

ARG CLOUDREVE_VERSION="3.0.0"

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh

RUN apt-get update \
    && apt-get install wget -y

RUN wget -O cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/$CLOUDREVE_VERSION/cloudreve_$CLOUDREVE_VERSION_linux_amd64.tar.gz
RUN tar -zxvf cloudreve.tar.gz -C /root/cloudreve
RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh
CMD /root/cloudreve/run.sh
