#!/bin/bash

# If you remove this line which installs vim, openvassd will fail to find some
# files. No, I don't know why. Yes, I tried installing each of vim's
# dependencies one by one to see if one of them is a hidden dependency. Yes, I
# realize this reflects poorly on me as a developer.
apt-get install -y vim
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
