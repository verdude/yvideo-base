FROM openjdk:8-alpine

ENV SCALA_VERSION 2.11.7
ENV SBT_VERSION 0.13.8

RUN apk update && apk add git && \
    git clone -b develop --depth 1 https://github.com/BYU-ODH/yvideo

RUN apk update && apk add bash && \
    wget -O sbt.zip "https://github.com/sbt/sbt/releases/download/v0.13.18/sbt-0.13.18.zip" && \
    unzip -q sbt.zip && \
    ln -s /sbt/bin/sbt /usr/local/bin/sbt && \
    cd /yvideo && \
    sbt compile

WORKDIR /yvideo

RUN ls -A1 | grep -v target | xargs rm -r

