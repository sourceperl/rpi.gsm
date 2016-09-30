#!/bin/bash
# setup smstools for build a SMS gateway with Rpi and Huawei E270 modem

# vars
NAME=$(basename $0)

# check root
[ $EUID -ne 0 ] && { printf "ERROR: $NAME needs to be run by root\n" 1>&2; exit 1; }

# current dir is script dir
cd "$(dirname "$0")"

# install packages
apt-get update && apt-get -y upgrade
apt-get install -y smstools

# configure
cp -ax etc/. /etc/.
chown root:root /etc/udev/rules.d/10-fix-modem.rules

# add tools
cp -ax usr/local/. /usr/local/.

# end message
echo "reboot to update serial device and smstools"
