#!/bin/bash

touch /home/vagrant/.bash_profile
if ! grep "cd /vagrant" /home/vagrant/.bash_profile
then
  echo "cd /vagrant" >> /home/vagrant/.bash_profile
fi
