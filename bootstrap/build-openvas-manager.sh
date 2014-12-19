#!/bin/bash

cd /home/vagrant/openvas-manager-5.0.7/

mkdir build
cd build
cmake ..
make install

openvas-mkcert-client -n -i
