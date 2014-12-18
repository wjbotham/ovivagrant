#!/bin/bash

cd /home/vagrant/openvas-cli-1.3.1/

mkdir build
cd build
cmake ..
make install
