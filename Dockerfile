FROM alpine:3.7

MAINTAINER mkuhlmann

RUN apk add --no-cache libstdc++ && \
	apk add --no-cache --virtual .build-deps \
		binutils-gold \
		g++ \
		gcc \
		gnupg \
		libgcc \
		linux-headers \
		make

RUN apk --no-cache add python3-dev py-pip py3-netifaces

# required for xiaomi aqara
RUN apk --no-cache add libffi-dev openssl-dev

RUN pip3 --no-cache-dir install --upgrade pip

# required for media_player.frontier_silicon
RUN apk --no-cache add py-lxml
RUN pip3 --no-cache-dir install afsapi

RUN mkdir /config && \
	pip3 --no-cache-dir install homeassistant

EXPOSE 8123

VOLUME /config

CMD [ "python3", "-m", "homeassistant", "--config", "/config" ]
