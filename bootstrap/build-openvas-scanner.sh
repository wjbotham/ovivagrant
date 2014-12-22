#!/bin/bash

cd /home/vagrant/openvas-scanner-4.0.5/

mkdir build
cd build
cmake ..
make install
make rebuild_cache
make install
