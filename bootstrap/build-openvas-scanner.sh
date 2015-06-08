#!/bin/bash

cd /home/vagrant/openvas-scanner-5.0.3/

mkdir build
cd build
cmake ..
make install
make rebuild_cache
make install
