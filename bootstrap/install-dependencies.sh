#!/bin/bash

echo >> /etc/apt/sources.list
echo '# This line was added by a Vagrant bootstrap script.' >> /etc/apt/sources.list
echo '# It gives access to a later version of libmicrohttpd-dev.' >> /etc/apt/sources.list
echo 'deb http://ftp.de.debian.org/debian wheezy main' >> /etc/apt/sources.list
gpg --keyserver keys.gnupg.net --recv-keys 6FB2A1C265FFB764
gpg -a --export 6FB2A1C265FFB764 | apt-key add -
if [ `gpg --list-public-keys | grep 'Wheezy Stable Release Key' | wc -l` -eq '0' ]
then
  echo "Key was not successfully imported. Might be a network connectivity"
  echo "issue? Not sure yet."
  exit 1
fi

apt-get update

# needed for everything
apt-get install -y make cmake pkg-config

# requirements for openvas-libraries (and possibly others)
apt-get install -y libssh-dev libgnutls-dev libglib2.0-dev libpcap-dev libgpgme11-dev uuid-dev bison libksba-dev

# requirements for openvas-manager (and possibly others)
apt-get install -y libsqlite3-dev sqlite3

# requirements for openvas-scanner (and possibly others)
apt-get install -y libopenvas2

# requirements for greenbone-security-assistant (and possibly others)
apt-get install -y xsltproc libxml2-dev libxslt1-dev libmicrohttpd-dev=0.9.20-1+deb7u1
