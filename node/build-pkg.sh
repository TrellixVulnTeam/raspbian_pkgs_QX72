#!/usr/bin/env bash

PACKAGE=node-v8.0.0-linux-armv6l

# fix permissions first
chmod 0755 ${PACKAGE}/DEBIAN
chmod 0755 ${PACKAGE}/DEBIAN/*

# build package
dpkg-deb --build ${PACKAGE}
#cp python3-kevin.deb ../packages
