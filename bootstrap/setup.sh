#!/bin/bash

openvas-nvt-sync
openvas-scapdata-sync
openvas-certdata-sync

rm /usr/local/var/lib/openvas/mgr/tasks.db
openvasmd --rebuild
