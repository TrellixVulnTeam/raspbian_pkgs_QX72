#!/usr/bin/env bash

echo "fixing apt sources"
sh -c 'echo "deb http://www.deb-multimedia.org jessie main" >> /etc/apt/sources.list'

echo "updating apt-get and installing ffmpeg"
apt-get update
apt-get install deb-multimedia-keyring
apt-get install ffmpeg
