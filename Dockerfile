FROM openjdk:8-alpine

ENV SCALA_VERSION 2.11.7
ENV SBT_VERSION 0.13.8

COPY yvideo /yvideo

RUN apk update && apk add bash && \
    wget -q "https://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.zip" && \
    unzip -q sbt-$SBT_VERSION.zip && \
    ln -s /sbt/bin/sbt /usr/local/bin/sbt && \
    cd /yvideo && \
    sbt compile

RUN cd /yvideo && ls -1 | grep -v target | xargs rm -r

WORKDIR /yvideo

