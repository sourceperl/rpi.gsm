#!/bin/bash
# setup wvdial to manage ppp connexion to internet from a Rpi with Huawei E270 modem

# vars
NAME=$(basename $0)

# check root
[ $EUID -ne 0 ] && { printf "ERROR: $NAME needs to be run by root\n" 1>&2; exit 1; }

# current dir is script dir
cd "$(dirname "$0")"

# install packages
apt-get update && apt-get -y upgrade
apt-get install -y wvdial supervisor

# configure
cp -ax etc/. /etc/.
supervisorctl update
