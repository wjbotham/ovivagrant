#!/bin/bash

if [ ! -d /vagrant/downloads ]
then
  mkdir /vagrant/downloads
fi
cd /vagrant/downloads

deps=(
  "openvas-libraries-7.0.6|1833"
  "openvas-scanner-4.0.5|1844"
  "openvas-manager-5.0.7|1849"
  "greenbone-security-assistant-5.0.4|1799"
  "openvas-cli-1.3.1|1803"
)
for dep in ${deps[@]}
do
  name=`echo $dep | cut -f 1 -d '|'`
  id=`echo $dep | cut -f 2 -d '|'`
  if [ ! -f $name.tar.gz ]
  then
    wget http://wald.intevation.org/frs/download.php/$id/$name.tar.gz
  fi
  ORIGINAL_SHA=$(awk '{print $1}' /vagrant/checksums/$name.tar.gz.sha1)
  CURRENT_SHA=$(openssl dgst -sha1 $name.tar.gz | awk '{print $2}')
  [ "$ORIGINAL_SHA" != "$CURRENT_SHA" ] && { echo "ERROR: $name did not have matching SHA1!"; exit 1; }
  tar xzf $name.tar.gz -C /home/vagrant
done

echo "!!!!!! All SHA1 fields matched !!!!!!"
