#!/usr/bin/env bash


echo "start ---------------"

PYTHON_VERSION=3.6.1
CURRDIR=$(pwd)
PYTHON_INSTALL_DIR="$CURRDIR/python3/usr/local"

echo ""
echo "-------------------------------------------------"
echo "Installing to: $PYTHON_INSTALL_DIR"
echo "-------------------------------------------------"
echo ""


if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
	# apt-get update
	apt-get -y upgrade
	apt-get -y install build-essential cmake git pkg-config
	apt-get -y install tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
fi

if [ ! -f Python-$PYTHON_VERSION.tar.xz ]; then
	wget https://www.python.org/ftp/python/3.6.1/Python-$PYTHON_VERSION.tar.xz
else
	echo "Using previously downloaded file"
	rm -fr Python-$PYTHON_VERSION
fi

# setup things
tar xf Python-$PYTHON_VERSION.tar.xz
cd Python-$PYTHON_VERSION
./configure --prefix=$PYTHON_INSTALL_DIR

# make and install
make -j4
# make install

# clean up
# rm -fr opencv-$OPENCV_VERSION
