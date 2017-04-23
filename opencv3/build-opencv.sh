#!/usr/bin/env bash

# https://github.com/opencv/opencv/issues/7744

echo "start ---------------"

# -D PYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
# -D PYTHON_INCLUDE_DIR2=$(python3 -c "from os.path import dirname; from distutils.sysconfig import get_config_h_filename; print(dirname(get_config_h_filename()))") \
# -D PYTHON_LIBRARY=$(python3 -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
# -D PYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "import numpy; print(numpy.get_include())") \
# -D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
#

USR=pi
OPENCV_VERSION=3.2.0
CURRDIR=$(pwd)
OPENCV_INSTALL_DIR="$CURRDIR/libopencv3-kevin/usr/local"

echo ""
echo "-------------------------------------------------"
echo "Installing to: $OPENCV_INSTALL_DIR"
echo "-------------------------------------------------"
echo ""

# python 2
PY2LIB=$(python -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))")
PY2INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
PY2EXE=$(which python)
PY2NUMPY=$(python -c "import numpy; print(numpy.get_include())")
#PY2PKGS=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
PY2PKGS=$OPENCV_INSTALL_DIR/lib/python2.7/dist-packages

# python 3
PY3LIB=$(python3 -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))")
PY3INCLUDE=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
PY3EXE=$(which python3)
PY3NUMPY=$(python3 -c "import numpy; print(numpy.get_include())")
#PY3PKGS=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
PY3PKGS=$OPENCV_INSTALL_DIR/lib/python3/dist-packages

if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
	# apt-get update
	apt-get -y upgrade
	apt-get -y install build-essential cmake git pkg-config python-dev swig
	apt-get -y install libeigen3-dev
	apt-get -y install ffmpeg
	apt-get -y install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
	apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
	apt-get -y install libxvidcore-dev libx264-dev
	apt-get -y install libatlas-base-dev gfortran
	apt-get -y install python2.7-dev python3-dev
	apt-get -y install libgtk2.0-dev

	# update python2
	#su $USR -c "pip install -U pip setuptools wheel"
	#su $USR -c "pip install -U numpy PyYAML matplotlib simplejson"

	# update python3
	if type python3 &> /dev/null; then
		echo "found python3"
		#su $USR -c "pip3 install -U pip setuptools wheel"
		#su $USR -c "pip3 install -U numpy PyYAML matplotlib simplejson"
	fi
fi

if [ ! -f $OPENCV_VERSION.tar.gz ]; then
	wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.tar.gz
else
	echo "Using previously downloaded file"
	# rm -fr opencv-$OPENCV_VERSION
fi

# setup things
tar -xzf $OPENCV_VERSION.tar.gz
mkdir opencv-$OPENCV_VERSION/build
cd opencv-$OPENCV_VERSION/build

cmake -DCMAKE_BUILD_TYPE=RELEASE \
-DCMAKE_INSTALL_PREFIX=$OPENCV_INSTALL_DIR \
-DBUILD_opencv_python2=ON \
-DPYTHON2_PACKAGES_PATH=$PY2PKGS \
-DPYTHON2_LIBRARY=$PY2LIB \
-DPYTHON2_INCLUDE_DIR=$PY2INCLUDE \
-DPYTHON2_NUMPY_INCLUDE_DIRS=$PY2NUMPY \
-DPYTHON2_EXECUTABLE=$PY2EXE \
-DBUILD_opencv_python3=ON \
-DPYTHON3_PACKAGES_PATH=$PY3PKGS \
-DPYTHON3_LIBRARY=$PY3LIB \
-DPYTHON3_INCLUDE_DIR=$PY3INCLUDE \
-DPYTHON3_NUMPY_INCLUDE_DIRS=$PY3NUMPY \
-DPYTHON3_EXECUTABLE=$PY3EXE \
..

# make and install
make -j4
make install

# clean up
# rm -fr opencv-$OPENCV_VERSION
