#! /bin/bash

set -e

XLRELEASE_DIR="xl-release-${VERSION}-server"
XLRELEASE_SERVER="https://dist.xebialabs.com/public/trial/xl-release/xl-release-${VERSION}-server.zip"

if [ ! "$(ls -A /xl-server)" ]; then
  cp -R $XLRELEASE_DIR/* /xl-server/ && \
  cd /xl-server/bin && \
  sh ./run.sh -setup -reinitialize -force -setup-defaults ../../xlrelease.answers
fi

cd /xl-server/bin
sh ./run.sh
