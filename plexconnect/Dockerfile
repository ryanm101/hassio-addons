FROM alpine

ENV PMS_IP 192.168.2.1
ENV PMS_PORT 32400
ENV DNS_MASTER 8.8.8.8


# Setup base
RUN \
    apk add --no-cache \
        python \
        openssl \
        git \
    && git clone https://github.com/iBaa/PlexConnect.git /srv/plexconnect \
    && apk del --no-cache git

EXPOSE 53 80 443

VOLUME ["/srv/plexconnect/assets/certificates"]

COPY ./Settings.cfg /srv/plexconnect/ 
COPY ./ATVSettings.cfg /srv/plexconnect/ 

COPY ./run.sh /

ENTRYPOINT ["/run.sh"]
