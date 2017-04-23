#!/usr/bin/env bash

echo "$USER"
echo "start ---------------"

ZMQ_VERSION=4.2.1
CURRDIR=$(pwd)
ZMQ_INSTALL_DIR="$CURRDIR/zeromq-kevin/usr/local"

echo ""
echo "-------------------------------------------------"
echo "Installing to: $ZMQ_INSTALL_DIR"
echo "-------------------------------------------------"
echo ""


if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
	echo "Upgrading software"
	echo ""
	# apt-get update
	apt-get -y upgrade
	apt-get -y install build-essential cmake git pkg-config
	apt-get -y install libtool autoconf automake uuid-dev libunwind-dev

	echo "System ready"
	echo ""
fi

if [ ! -f zeromq-$ZMQ_VERSION.tar.gz ]; then
	wget https://github.com/zeromq/libzmq/releases/download/v$ZMQ_VERSION/zeromq-$ZMQ_VERSION.tar.gz
else
	echo "Using previously downloaded file"
	rm -fr zeromq-$ZMQ_VERSION
fi

# setup things
tar zxf zeromq-$ZMQ_VERSION.tar.gz
cd zeromq-$ZMQ_VERSION
./configure --prefix=$ZMQ_INSTALL_DIR

# make and install
make -j4
# make install

# clean up
# rm -fr opencv-$OPENCV_VERSION
