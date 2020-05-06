FROM debian:stable-slim

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD trackers-list-aria2.sh /root/aria2/trackers-list-aria2.sh
ADD run.sh /root/cloudreve/run.sh

RUN apt-get update \
    && apt-get install wget curl aria2 -y

RUN wget -O cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_amd64.tar.gz
RUN tar -zxvf cloudreve.tar.gz -C /root/cloudreve
RUN touch /root/.aria2/aria2.session /root/.aria2/aria2.log
RUN chmod +x /root/cloudreve/cloudreve \
    && chmod +x /root/cloudreve/run.sh \
    && chmod +x /root/.aria2/trackers-list-aria2.sh

RUN 
CMD /root/cloudreve/run.sh
