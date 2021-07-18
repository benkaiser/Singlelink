FROM node:14.15.0-buster-slim

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN npm install typescript -g

COPY ./ singlelink/

WORKDIR singlelink

RUN npm install

RUN npm run build

CMD npm run start
