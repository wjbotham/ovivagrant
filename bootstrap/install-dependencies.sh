#!/bin/bash

apt-get update

# needed for everything
apt-get install -y make cmake pkg-config git

# requirements for openvas-libraries (and possibly others)
apt-get install -y libssh-dev libgnutls-dev libglib2.0-dev libpcap-dev libgpgme11-dev uuid-dev bison libksba-dev
git clone git://github.com/redis/hiredis.git
cd hiredis
make && make install

# requirements for openvas-manager (and possibly others)
apt-get install -y libsqlite3-dev sqlite3

# requirements for openvas-scanner (and possibly others)
apt-get install -y libopenvas2 redis-server
cp /vagrant/config/redis.conf /etc/redis/redis.conf

# requirements for greenbone-security-assistant (and possibly others)
apt-get install -y zlib1g-dev xsltproc libxml2-dev libxslt1-dev libmicrohttpd-dev
