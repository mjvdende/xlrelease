FROM maven:3.3-jdk-8
MAINTAINER Maarten van den Ende <mvandenende@xebia.com>

ENV VERSION 4.8.1
RUN apt-get update
RUN apt-get install -y unzip wget

RUN wget https://dist.xebialabs.com/public/trial/xl-release/xl-release-4.8.1-server.zip -O /tmp/xlr.zip && unzip /tmp/xlr.zip -d /opt && rm /tmp/xlr.zip
ADD xlrelease.answers /opt/xl-release-4.8.1-server/bin/xlrelease.answers

WORKDIR /opt/xl-release-4.8.1-server/bin
RUN ["./server.sh", "-setup", "-reinitialize", "-force", "-setup-defaults", "./bin/xlrelease.answers"]

EXPOSE 4516
EXPOSE 5516
CMD ["./server.sh"]
