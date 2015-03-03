#!/bin/bash

# define pacman packages
pacman_packages="libcups jre7-openjdk-headless fontconfig unzip"

# install pre-reqs
pacman -Sy --noconfirm
pacman -S --needed $pacman_packages --noconfirm

# create destination directories
mkdir -p /home/nobody/media
mkdir -p /home/nobody/transcode

# unzip madsonic and transcode
unzip /home/nobody/madsonic.zip -d /home/nobody
unzip /home/nobody/transcode/transcode.zip -d /home/nobody/transcode

# remove source zip files
rm /home/nobody/madsonic.zip
rm /home/nobody/transcode/transcode.zip

# force process to run as foreground task
sed -i 's/-jar madsonic-booter.jar > \${LOG} 2>\&1 \&/-jar madsonic-booter.jar > \${LOG} 2>\&1/g' /home/nobody/madsonic.sh

# set permissions
chown -R nobody:users /home/nobody
chmod -R 775 /home/nobody

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*
