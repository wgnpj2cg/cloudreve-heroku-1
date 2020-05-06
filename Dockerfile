FROM debian:stable-slim

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD aria2.conf /root/aria2/aria2.conf
ADD aria2 /etc/init.d/aria2
ADD trackers-list-aria2.sh /root/aria2/trackers-list-aria2.sh
ADD run.sh /root/run.sh

RUN apt-get update \
    && apt-get install wget curl aria2 -y

RUN wget -O cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_amd64.tar.gz \
    && wget -O /root/aria2/dht.dat https://github.com/P3TERX/aria2.conf/raw/master/dht.dat
    
RUN tar -zxvf cloudreve.tar.gz -C /root/cloudreve
RUN touch /root/.aria2/aria2.session /root/.aria2/aria2.log
RUN chmod +x /root/cloudreve/cloudreve \
    && chmod +x /etc/init.d/aria2 \
    && chmod +x /root/aria2/trackers-list-aria2.sh \
    && chmod +x /root/cloudreve/run.sh

RUN CMD /root/cloudreve/run.sh
