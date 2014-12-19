#!/bin/bash

OPENVAS_DIR=/usr/local/var/lib/openvas
NVT=$OPENVAS_DIR/plugins
NVT_TAR=nvt-feed-backup.tar.gz
SCAP=$OPENVAS_DIR/scap-data
SCAP_TAR=scap-feed-backup.tar.gz
CERT=$OPENVAS_DIR/cert-data
CERT_TAR=cert-feed-backup.tar.gz

if [ "$1" = "restore" ]
then
  echo "Checking for feed data to restore from archive..."
  # If OpenVAS is missing data for one of the three feeds and we have an archive
  # for that feed, then we give it to OpenVAS.
  if [[ -f $NVT_TAR && ! -d $NVT ]]
  then
    tar -zxf $NVT_TAR -C /
  fi
  if [[ -f $SCAP_TAR && ! -d $SCAP ]]
  then
    tar -zxf $SCAP_TAR -C /
  fi
  if [[ -f $CERT_TAR && ! -d $CERT ]]
  then
    tar -zxf $CERT_TAR -C /
  fi
elif [ "$1" = "save" ]
then
  echo "Archiving and compressing the updated feed data..."
  tar -zcf $NVT_TAR $NVT
  tar -zcf $SCAP_TAR $SCAP
  tar -zcf $CERT_TAR $CERT
else
  echo "Feed archive script does not recognize this argument: $1"
fi
