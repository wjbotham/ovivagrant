#!/bin/bash

# needed to prevent an occasional linking error
ldconfig

cp /vagrant/config/redis.conf /etc/redis/redis.conf
/etc/init.d/redis-server restart

openvassd
while [ `ps -aef | grep openvassd | grep "Waiting for incoming connections" | wc -l` -eq 0 ]
do
  ps -aef | grep openvassd | grep Reloaded | awk '{for(i=8;i<NF;i++)printf "%s",$i OFS; if (NF) printf "%s",$NF; printf ORS}'
  if [ `ps -aef | grep openvas | grep openvassd | wc -l` -eq 0 ]
  then
    echo "The openvassd process disappeared! Exiting."
    exit 1
  fi
  sleep 30
done
echo "OpenVAS Scanner is running!"
