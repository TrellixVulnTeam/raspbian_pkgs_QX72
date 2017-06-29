#!/usr/bin/env bash

set -e

# check if we are root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

. ./update-python3.sh

dpkg -i python3.deb

echo ""
echo "python 3 is installed"
echo ""
