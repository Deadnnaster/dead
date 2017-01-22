FROM alpine

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 51348
ENV PASSWORD=
ENV METHOD      aes-256-cfb
ENV PROTOCOL    auth_aes128_md5
ENV OBFS      http_post
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8
ENV DNS_ADDR_2  8.8.4.4

RUN apk update \
    && apk add python libsodium unzip wget py2-pip \
    && pip install https://github.com/Deadnnaster/shadowsocksr/archive/Deadnnaster-patch-1.zip


WORKDIR ~/shadowsocks


CMD python ~/shadowsocks/server.py -p $SERVER_PORT -k 112233 -m $METHOD  -O $PROTOCOL -o $OBFS
