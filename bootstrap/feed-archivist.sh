#!/bin/bash

OPENVAS_DIR=/usr/local/var/lib/openvas
ARCHIVE_DIR=/vagrant/archives
NVT=$OPENVAS_DIR/plugins
NVT_TAR=$ARCHIVE_DIR/nvt-feed.tar.gz
SCAP=$OPENVAS_DIR/scap-data
SCAP_TAR=$ARCHIVE_DIR/scap-feed.tar.gz

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
  if [[ ! -d $NVT/private ]]
  then
    mkdir $NVT/private
  fi
  echo "This file is here to make sure this directory survives being archived! If this directory doesn't exist, certain parts of the openvas-check-status script get confused about which OpenVAS version we're going for." > $NVT/private/keeping-the-door-open.txt
  { time tar -zcf $NVT_TAR  $NVT  ; } 2> /vagrant/nvt_tar_time.log
  { time tar -zcf $SCAP_TAR $SCAP ; } 2> /vagrant/scap_tar_time.log
else
  echo "Feed archive script does not recognize this argument: $1"
fi
