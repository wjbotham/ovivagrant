#!/bin/bash

echo >> /etc/apt/sources.list
echo '# This line was added by a Vagrant bootstrap script.' >> /etc/apt/sources.list
echo '# It gives access to a later version of libmicrohttpd-dev.' >> /etc/apt/sources.list
echo 'deb http://ftp.de.debian.org/debian wheezy main' >> /etc/apt/sources.list
gpg --keyserver keys.gnupg.net --recv-keys 6FB2A1C265FFB764
gpg -a --export 6FB2A1C265FFB764 | apt-key add -
# TODO
# Verify that the key was retrieved and exported. I saw it fail once with this
# output:
#
# gpg: directory `/root/.gnupg' created
# gpg: new configuration file `/root/.gnupg/gpg.conf' created
# gpg: WARNING: options in `/root/.gnupg/gpg.conf' are not yet active during this run
# gpg: keyring `/root/.gnupg/secring.gpg' created
# gpg: keyring `/root/.gnupg/pubring.gpg' created
# gpg: requesting key 65FFB764 from hkp server keys.gnupg.net
# gpgkeys: key 6FB2A1C265FFB764 not found on keyserver
# gpg: no valid OpenPGP data found.
# gpg: Total number processed: 0
# gpg: WARNING: nothing exported
# gpg: no valid OpenPGP data found.
#
# TODO

apt-get update

# needed for everything
apt-get install -y make cmake pkg-config

# requirements for openvas-libraries (and possibly others)
apt-get install -y libssh-dev libgnutls-dev libglib2.0-dev libpcap-dev libgpgme11-dev uuid-dev bison libksba-dev

# requirements for openvas-manager (and possibly others)
apt-get install -y libsqlite3-dev

# requirements for openvas-scanner (and possibly others)
apt-get install -y libopenvas2

# requirements for greenbone-security-assistant (and possibly others)
apt-get install -y xsltproc libxml2-dev libxslt1-dev libmicrohttpd-dev=0.9.20-1+deb7u1

# requirements for SCAP sync
apt-get install -y sqlite3
