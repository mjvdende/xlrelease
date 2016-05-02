FROM java:openjdk-8-jdk
MAINTAINER Maarten van den Ende <mvandenende@xebia.com>

ENV version 5.0.0
RUN apt-get update
RUN apt-get install -y unzip wget

RUN wget https://dist.xebialabs.com/public/trial/xl-release/xl-release-${version}-server.zip -O /tmp/xlr.zip && unzip /tmp/xlr.zip -d /opt && rm /tmp/xlr.zip
ADD xlrelease.answers /opt/xl-release-${version}-server/bin/xlrelease.answers

WORKDIR /opt/xl-release-${version}-server/bin
RUN ["./server.sh", "-setup", "-reinitialize", "-force", "-setup-defaults", "./bin/xlrelease.answers"]

EXPOSE 4516
EXPOSE 5516
CMD ["./server.sh"]
