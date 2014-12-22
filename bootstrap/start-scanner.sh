#!/bin/bash

# needed to prevent an occasional linking error
ldconfig

openvassd
while [ `ps -aef | grep openvassd | grep "Waiting for incoming connections" | wc -l` -eq 0 ]
do
  ps -aef | grep openvassd | grep Reloaded | awk '{for(i=8;i<NF;i++)printf "%s",$i OFS; if (NF) printf "%s",$NF; printf ORS}'
  sleep 10
done
