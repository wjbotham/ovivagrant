#!/bin/bash

OPENVAS_DIR=/usr/local/var/lib/openvas
VAG_DIR=/vagrant
NVT=$OPENVAS_DIR/plugins
NVT_TAR=nvt-feed-backup.tar.gz
SCAP=$OPENVAS_DIR/scap-data
SCAP_TAR=scap-feed-backup.tar.gz
CERT=$OPENVAS_DIR/cert-data
CERT_TAR=vagrant/cert-feed-backup.tar.gz

if [ "$1" = "restore" ]
then
  echo "Checking for feed data to restore from archive..."
  # If OpenVAS is missing data for one of the three feeds and we have an archive
  # for that feed, then we give it to OpenVAS.
  if [[ -f $VAG_DIR/$NVT_TAR && ! -f $NVT/plugin_feed_info.inc ]]
  then
    echo "Restoring NVT..."
    tar -zxvf $VAG_DIR/$NVT_TAR -C /
  fi
  if [[ -f $VAG_DIR/$SCAP_TAR && ! -d $SCAP ]]
  then
    echo "Restoring SCAP..."
    tar -zxvf $VAG_DIR/$SCAP_TAR -C /
  fi
  if [[ -f $VAG_DIR/$CERT_TAR && ! -d $CERT ]]
  then
    echo "Restoring CERT..."
    tar -zxvf $VAG_DIR/$CERT_TAR -C /
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
