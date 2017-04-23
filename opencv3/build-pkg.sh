#!/usr/bin/env bash

dpkg-deb --build libopencv3-kevin
mv libopencv.deb ../packages
