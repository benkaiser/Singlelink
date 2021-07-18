FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install NodeJS
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install --no-install-recommends -y nodejs npm g++ build-essential automake libtool pkgconf


COPY ./ singlelink/

WORKDIR singlelink

ENV NODE_OPTIONS=--max-old-space-size=8192

RUN npm install typescript -g && npm install

RUN npm run build

CMD npm run start
