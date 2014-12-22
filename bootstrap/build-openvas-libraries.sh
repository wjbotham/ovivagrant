#!/bin/bash

cd /home/vagrant/openvas-libraries-7.0.6/

mkdir build
cd build
cmake ..
make install
make rebuild_cache
make install
