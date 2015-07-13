#!/bin/bash

echo "Starting OpenVAS Manager..."
openvasmd -v

# This line turns off Greenbone's logging because it causes the following
# error that constantly kills Greenbone while I'm working with it:
#   g_string_erase: assertion `pos + len <= string->len' failed
sed -i 's/level=[0-9]\+/level=0/' /usr/local/etc/openvas/gsad_log.conf
echo "Starting Greenbone..."
gsad -v
