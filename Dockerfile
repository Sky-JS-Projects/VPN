FROM shadowsocks/shadowsocks-libev:latest

USER root

RUN set -x\
    && apk update \
    && apk upgrade \
    && apk add wget unzip libqrencode \
    && apk add nginx

COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh
COPY v2 /v2

RUN chmod +x /v2
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
