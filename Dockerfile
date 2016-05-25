FROM maven:3.3.3-jdk-8
MAINTAINER Maarten van den Ende <mvandenende@xebia.com>

RUN apt-get update
RUN apt-get install -y unzip curl wget

ENV VERSION 5.0.0
ENV XLRELEASE_FILE=xl-release-${VERSION}-server
ENV XLRELEASE=https://dist.xebialabs.com/public/trial/xl-release/${XLRELEASE_FILE}.zip

RUN curl -O ${XLRELEASE}
RUN unzip ${XLRELEASE_FILE}.zip
RUN rm ${XLRELEASE_FILE}.zip

ADD xlrelease.answers xlrelease.answers
ADD xlrelease.sh xlrelease.sh

RUN mkdir xl-server
VOLUME /xl-server
EXPOSE 5516
CMD ["./xlrelease.sh"]
