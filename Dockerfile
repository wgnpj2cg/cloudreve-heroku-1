FROM debian:stable-slim

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD aria2.conf /root/aria2/aria2.conf
ADD trackers-list-aria2.sh /root/aria2/trackers-list-aria2.sh
ADD run.sh /root/cloudreve/run.sh
ADD cloudreve /root/cloudreve
RUN apt-get update \
    && apt-get install wget curl aria2 -y

RUN wget -qO cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_amd64.tar.gz \
    && wget -qO /root/aria2/dht.dat https://github.com/P3TERX/aria2.conf/raw/master/dht.dat \
    && wget -qO /root/aria2/dht6.dat https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat

RUN touch /root/aria2/aria2.session /root/aria2/aria2.log
RUN chmod +x /root/cloudreve/cloudreve \
    && chmod +x /root/aria2/trackers-list-aria2.sh \
    && chmod +x /root/cloudreve/run.sh
RUN mkdir -p /root/Download

CMD /root/cloudreve/run.sh
