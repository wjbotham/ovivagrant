#!/bin/bash

openvas-mkcert -q
openvas-mkcert-client -n -i

# If you remove this line which installs vim, the openvas-nvt-sync will fail.
# No, I don't know why. Yes, I tried installing each of vim's dependencies
# one by one to see if one of them is a hidden dependency. Yes, I realize this
# reflects poorly on me as a developer.
apt-get install -y vim
openvas-nvt-sync
openvas-scapdata-sync
openvas-certdata-sync
