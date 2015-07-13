#!/bin/bash

bash /vagrant/openvas-check-setup
echo `ps -ef | grep openvas`

echo 'Please run `vagrant ssh` and set your Greenbone admin password:'
echo '  openvasmd --user=admin --new-password=<YOUR CHOSEN PASSWORD>'
