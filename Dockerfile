FROM arm64v8/alpine:3.15.0

VOLUME [ "/data" ]

RUN mkdir -p /workdir
WORKDIR /workdir

RUN apk update

RUN apk add --no-cache --upgrade grep wget jq
RUN apk add alpine-sdk

ADD ./download_bootstrap.sh ./
RUN ./download_bootstrap.sh
RUN apk add --allow-untrusted *.apk

RUN git clone --depth 1 --branch v3.15.0 git://git.alpinelinux.org/aports

ADD ./builder.sh ./