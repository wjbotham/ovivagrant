#!/bin/bash

NVT=/usr/local/var/lib/openvas/plugins
NVT_TAR=nvt-feed-backup.tar.gz
SCAP=/usr/local/var/lib/openvas/scap-data
SCAP_TAR=scap-feed-backup.tar.gz
CERT=/usr/local/var/lib/openvas/cert-data
CERT_TAR=cert-feed-backup.tar.gz

if [ "$1" = "restore" ]
then
  echo "Checking for feed data to restore from archive..."
  # If OpenVAS is missing data for one of the three feeds and we have an archive
  # for that feed, then we give it to OpenVAS.
  if [[ -f $NVT_TAR && ! -d $NVT ]]
  then
    tar -zxvf $NVT_TAR -C $NVT
  fi
  if [[ -f $SCAP_TAR && ! -d $SCAP ]]
  then
    tar -zxvf $SCAP_TAR -C $SCAP
  fi
  if [[ -f $CERT_TAR && ! -d $CERT ]]
  then
    tar -zxvf $CERT_TAR -C $CERT
  fi
elif [ "$1" = "save" ]
then
  echo "Archiving and compressing the updated feed data..."
  tar -zcvf $NVT_TAR $NVT
  tar -zcvf $SCAP_TAR $SCAP
  tar -zcvf $CERT_TAR $CERT
else
  echo "Feed archive script does not recognize this argument: $1"
fi
