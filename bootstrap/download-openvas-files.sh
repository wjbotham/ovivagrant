#!/bin/bash

if [ ! -d /vagrant/downloads ]
then
  mkdir /vagrant/downloads
fi
cd /vagrant/downloads

# These strings are the info needed to download the OpenVAS source code. The
# first part (openvas-libraries-x.x.x) is the name of the file minus the prefix
# (.tar.gz). The second part is a unique download ID. This will make more sense
# you look at the wget command below.
deps=(
  "openvas-libraries-8.0.3|2067"
  "openvas-scanner-5.0.3|2071"
  "openvas-manager-6.0.3|2075"
  "greenbone-security-assistant-6.0.3|2079"
  "openvas-cli-1.4.1|2093"
)
for dep in ${deps[@]}
do
  name=`echo $dep | cut -f 1 -d '|'`
  id=`echo $dep | cut -f 2 -d '|'`
  if [ ! -f $name.tar.gz ]
  then
    # $id is that download ID number, mentioned above
    wget http://wald.intevation.org/frs/download.php/$id/$name.tar.gz
  fi
  ORIGINAL_SHA=$(awk '{print $1}' /vagrant/checksums/$name.tar.gz.sha1)
  CURRENT_SHA=$(openssl dgst -sha1 $name.tar.gz | awk '{print $2}')
  [ "$ORIGINAL_SHA" != "$CURRENT_SHA" ] && { echo "ERROR: $name did not have matching SHA1"; exit 1; }
  tar xzf $name.tar.gz -C /home/vagrant
done

echo "!!!!!! All SHA1 fields matched !!!!!!"
