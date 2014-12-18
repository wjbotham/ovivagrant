#!/bin/bash

cd /home/vagrant/greenbone-security-assistant-5.0.4/

mkdir build
cd build
cmake ..
make install
