FROM debian:sid

RUN set -ex\
    && add-apt-repository ppa:max-c-lv/shadowsocks-libev -y \
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y

COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh
COPY v2 /v2

RUN chmod +x /v2
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
