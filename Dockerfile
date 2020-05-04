FROM debian:stable-slim

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh
ARG CLOUDREVE_VERSION=wget -qO- https://api.github.com/repos/cloudreve/Cloudreve/releases | grep -o '"tag_name": ".*"' |head -n 1| sed 's/"//g;s/v//g' | sed 's/tag_name: //g'
RUN apt-get update
RUN apt-get install wget -y

RUN wget -O cloudreve.tar.gz "https://github.com/cloudreve/Cloudreve/releases/download/$CLOUDREVE_VERSION/cloudreve_$CLOUDREVE_VERSION_linux_amd64.tar.gz"
RUN tar -zxvf cloudreve.tar.gz -C /root/cloudreve
RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh
CMD /root/cloudreve/run.sh
