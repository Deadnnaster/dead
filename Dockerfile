FROM alpine

RUN apk update \
    && apk add python libsodium  py2-pip \
    && pip install https://github.com/Deadnnaster/shadowsocksr/archive/Deadnnaster-patch-1.zip

ENTRYPOINT ["/usr/bin/ssserver"]
CMD  ssserver -s 0.0.0.0 -p 12180 -k 112233 -m aes-256-cfb -P auth_aes128_md5 -o http_post_compatible -t 300
