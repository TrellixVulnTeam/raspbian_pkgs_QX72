#!/usr/bin/env bash

# fix permissions first
chmod 0755 node-pkg/DEBIAN/*

# build package
dpkg-deb --build node-pkg
#cp python3-kevin.deb ../packages
