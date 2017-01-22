FROM alpine

RUN apk update \
    && apk add python libsodium unzip wget py2-pip \
    && pip install https://github.com/Deadnnaster/shadowsocksr/archive/Deadnnaster-patch-1.zip


WORKDIR /shadowsocks


CMD  python server.py -c /config.json
