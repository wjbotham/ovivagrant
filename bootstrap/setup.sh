#!/bin/bash

openvas-mkcert -q
openvas-nvt-sync
openvas-certdata-sync
openvas-scapdata-sync
