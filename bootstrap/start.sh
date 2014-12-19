#!/bin/bash

openvassd
openvasmd -v
gsad -v

# wait until OpenVAS Scanner is running (adapted from Greenbone's openvas-check-setup script)
OPENVASSD_RUNNING=`ps -Af | grep "openvassd: [Ww]aiting for incoming connections" | grep -v grep | wc -l`
if [ $OPENVASSD_RUNNING -eq 0 ]
then
  echo "Waiting for OpenVAS Scanner..."
  sleep 1
fi

# TODO figure out how to tell when OpenVAS Manager and Greenbone Security Assistant are running 
