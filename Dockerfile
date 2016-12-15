FROM maven:3.3.3-jdk-8
MAINTAINER Maarten van den Ende <mvandenende@xebia.com>

RUN apt-get update
RUN apt-get install -y unzip curl wget

ENV VERSION 6.0.0
ENV XLRELEASE=xl-release-${VERSION}-server
ENV XLRELEASE_FILE=https://dist.xebialabs.com/public/trial/xl-release/${XLRELEASE}.zip

RUN curl -O ${XLRELEASE_FILE}
RUN unzip ${XLRELEASE}.zip

ADD xlrelease.answers xlrelease.answers
ADD xlrelease.sh xlrelease.sh

RUN mkdir xl-server
VOLUME /xl-server
EXPOSE 5516
CMD ["./xlrelease.sh"]
