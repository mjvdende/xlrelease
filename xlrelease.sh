#! /bin/bash

set -e

if [ ! "$(ls -A /xl-server)" ]; then
  cp -R $XLRELEASE/* /xl-server/ && \
  cd /xl-server/bin && \
  sh ./run.sh -setup -reinitialize -force -setup-defaults ../../xlrelease.answers
fi

cd /xl-server/bin
sh ./run.sh
