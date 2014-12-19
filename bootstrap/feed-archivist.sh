#!/bin/bash

OPENVAS_DIR=/usr/local/var/lib/openvas
VAG_DIR=/vagrant
NVT=$OPENVAS_DIR/plugins
NVT_TAR=$VAG_DIR/nvt-feed-backup.tar.gz
SCAP=$OPENVAS_DIR/scap-data
SCAP_TAR=$VAG_DIR/scap-feed-backup.tar.gz

if [ "$1" = "restore" ]
then
  echo "Checking for feed data to restore from archive..."
  # If OpenVAS is missing data for one of the three feeds and we have an archive
  # for that feed, then we give it to OpenVAS.
  if [[ -f $NVT_TAR && ! -f $NVT/plugin_feed_info.inc ]]
  then
    echo "Restoring NVT..."
    tar -zxf $NVT_TAR -C /
  fi
  if [[ -f $SCAP_TAR && ! -d $SCAP ]]
  then
    echo "Restoring SCAP..."
    tar -zxf $SCAP_TAR -C /
  fi
elif [ "$1" = "save" ]
then
  echo "Archiving and compressing the updated feed data..."
  { time tar -zcf $NVT_TAR  $NVT  ; } 2> /vagrant/nvt_tar_time.log
  { time tar -zcf $SCAP_TAR $SCAP ; } 2> /vagrant/scap_tar_time.log
else
  echo "Feed archive script does not recognize this argument: $1"
fi
