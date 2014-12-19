#!/bin/bash

cd /vagrant

if [ ! -f openvas-libraries-7.0.6.tar.gz ]
then
  wget http://wald.intevation.org/frs/download.php/1833/openvas-libraries-7.0.6.tar.gz
fi
if [ ! -f openvas-scanner-4.0.5.tar.gz ]
then
  wget http://wald.intevation.org/frs/download.php/1844/openvas-scanner-4.0.5.tar.gz
fi
if [ ! -f openvas-manager-5.0.7.tar.gz ]
then
  wget http://wald.intevation.org/frs/download.php/1849/openvas-manager-5.0.7.tar.gz
fi
if [ ! -f greenbone-security-assistant-5.0.4.tar.gz ]
then
  wget http://wald.intevation.org/frs/download.php/1799/greenbone-security-assistant-5.0.4.tar.gz
fi
if [ ! -f openvas-cli-1.3.1.tar.gz ]
then
  wget http://wald.intevation.org/frs/download.php/1803/openvas-cli-1.3.1.tar.gz
fi

CHECKSUMS=/vagrant/checksums/*
for SHA_FILE in $CHECKSUMS
do
  ORIGINAL_SHA=$(awk '{print $1}' $SHA_FILE)
  TARGET_FILE=$(awk '{print $2}' $SHA_FILE)
  CURRENT_SHA=$(openssl dgst -sha1 $TARGET_FILE | awk '{print $2}')
  [ "$ORIGINAL_SHA" != "$CURRENT_SHA" ] && { echo "ERROR: $SHA_FILE did not match SHA1 of $TARGET_FILE!"; exit 1; }
  tar xzf $TARGET_FILE -C /home/vagrant
done
echo "!!!!!! All SHA1 fields matched !!!!!!"
