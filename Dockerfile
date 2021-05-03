FROM adoptopenjdk/openjdk11:jdk-11.0.11_9-alpine-slim

ARG MVN_VER=3.8.1

RUN addgroup -g 1000 dockerUser && \ 
    adduser -D -u 1000 -G dockerUser dockerUser

RUN apk update && \
    wget https://mirrors.estointernet.in/apache/maven/maven-3/$MVN_VER/binaries/apache-maven-$MVN_VER-bin.tar.gz && \
    tar -xvf apache-maven-$MVN_VER-bin.tar.gz && \
    mv apache-maven-$MVN_VER /opt/

ENV M2_HOME="/opt/apache-maven-$MVN_VER"
ENV PATH="$M2_HOME/bin:$PATH"

USER dockerUser:dockerUser

WORKDIR /USER/dockerUser/

ENTRYPOINT [ "mvn", "-e" ]