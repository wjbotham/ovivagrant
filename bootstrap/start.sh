#!/bin/bash

# If you remove this line which installs vim, openvassd will fail to find some
# files. No, I don't know why. Yes, I tried installing each of vim's
# dependencies one by one to see if one of them is a hidden dependency. Yes, I
# realize this reflects poorly on me as a developer.
apt-get install -y vim
openvassd
openvasmd -v
gsad -v
