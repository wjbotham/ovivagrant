#!/bin/bash

cd /home/vagrant/openvas-manager-5.0.7/

mkdir build
cd build
cmake ..
make install
make rebuild_cache
make install
