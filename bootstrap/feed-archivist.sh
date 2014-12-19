#!/bin/bash

OPENVAS_DIR=/usr/local/var/lib/openvas
VAG_DIR=/vagrant
NVT=$OPENVAS_DIR/plugins
NVT_TAR=$VAG_DIR/nvt-feed-backup.tar.gz
SCAP=$OPENVAS_DIR/scap-data
SCAP_TAR=$VAG_DIR/scap-feed-backup.tar.gz
CERT=$OPENVAS_DIR/cert-data
CERT_TAR=$VAG_DIR/vagrant/cert-feed-backup.tar.gz

if [ "$1" = "restore" ]
then
  echo "Checking for feed data to restore from archive..."
  # If OpenVAS is missing data for one of the three feeds and we have an archive
  # for that feed, then we give it to OpenVAS.
  if [[ -f $NVT_TAR && ! -d $NVT ]]
  then
    echo "Restoring NVT..."
    tar -zxvf $NVT_TAR -C /
  fi
  if [[ -f $SCAP_TAR && ! -d $SCAP ]]
  then
    echo "Restoring SCAP..."
    tar -zxvf $SCAP_TAR -C /
  fi
  if [[ -f $CERT_TAR && ! -d $CERT ]]
  then
    echo "Restoring CERT..."
    tar -zxvf $CERT_TAR -C /
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
