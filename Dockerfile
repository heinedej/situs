FROM alpine
MAINTAINER Heine de Jager<heinedej@gmail.com>

WORKDIR /situs
RUN wget http://situs.biomachina.org/disseminate/Situs_2.8.tar.gz
RUN tar xvfz Situs_2.8.tar.gz
RUN apk update
RUN apk add alpine-sdk
WORKDIR /situs/Situs_2.8/src
VOLUME /situs
WORKDIR /situs
