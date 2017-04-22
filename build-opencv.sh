#!/bin/sh

set -ex

# setup ffmpeg
$ sudo sh -c 'echo "deb http://www.deb-multimedia.org jessie main" >> /etc/apt/sources.list'
$ sudo apt-get update
$ sudo apt-get install deb-multimedia-keyring
$ sudo apt-get install ffmpeg

# setup
OPENCV_VERSION=3.2.0
OPENCV_INSTALL_DIR="$HOME/opencv-$OPENCV_VERSION-install
LD_LIBRARY_PATH="$OPENCV_INSTALL_DIR/lib"

# update binary packages
apt-get update
apt-get -y upgrade
apt-get -y install deb-multimedia-keyring
apt-get -y install build-essential cmake git pkg-config python-dev swig
apt-get -y install libopenblas-dev libatlas-dev libblas-dev liblapack-dev
apt-get -y install gfortran libeigen3
apt-get -y install ffmpeg
apt-get -y install libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev
apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
apt-get -y install libgtk2.0-dev

# update python2
su pi -c pip install -U pip setuptools wheel
su pi -c pip install -U numpy PyYAML matplotlib simplejson

# update python3
su pi -c pip3 install -U pip setuptools wheel
su pi -c pip3 install -U numpy PyYAML matplotlib simplejson

# if [  ! -d "$OPENCV_INSTALL_DIR/lib"  ];then
wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.tar.gz

# ls -alh
mv $OPENCV_VERSION.tar.gz opencv-$OPENCV_VERSION.tar.gz
tar -xzf opencv-$OPENCV_VERSION.tar.gz
mkdir opencv-$OPENCV_VERSION/build
cd opencv-$OPENCV_VERSION/build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX="$OPENCV_INSTALL_DIR" .. && make -j2 && make install
# else
# 	echo  "Using cached opencv $OPENCV_VERSION install."
# fi
# # ldconfig
#
# cd $HOME

# cp $HOME/save $HOME/.local
# pip install -U --user pyserial
# ls -alhR $HOME/.local

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/save/lib
# export PYTHONPATH=$PYTHONPATH:$HOME/save/lib:$HOME/save/lib/python2.7:$HOME/save/lib/python2.7/site-packages
