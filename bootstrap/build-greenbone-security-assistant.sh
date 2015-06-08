#!/bin/bash

cd /home/vagrant/greenbone-security-assistant-6.0.3/

mkdir build
cd build
cmake ..
make install
make rebuild_cache
make install
