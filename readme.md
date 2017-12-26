**WARNING:** This repo is depreciated. I am breaking this up into individual repos. I often only need one of these and keeping them all together forces me to carry a lot of baggage around I am not updating or keeping track of.

# Rasbian Packages

Unfortunately raspbian has old packages and the linux distro model is to move
slow and not update things. Unfortunately linux homebrew doesn't always work
(I use homebrew on macOS and it is awesome!) on liux.

I have the following:

- OpenCV 3.x
- Python 3.6
- ZeroMQ 4.x

## Package Setup

- DEBIAN
    - control (required)
    - templates (optional)
    - preinst (optional, chmod 0755)
    - postinst (optional, chmod 0755)
    - prerm (optional, chmod 0755)
    - postrm (optional, chmod 0755)
 
 where:
 
**preinst** – this script executes before that package will be unpacked from its Debian archive (“.deb”) file. Many ‘preinst’ scripts stop services for packages which are being upgraded until their installation or upgrade is completed (following the successful execution of the ‘postinst’ script).

**postinst** – this script typically completes any required configuration of the package foo once it has been unpacked from its Debian archive (“.deb”) file. Often ‘postinst’ scripts ask the user for input, and/or warn the user that if they accept the default values, they should remember to go back and re-configure that package as the situation warrants. Many ‘postinst’ scripts then execute any commands necessary to start or restart a service once a new package has been installed or upgraded.

**prerm** – this script typically stops any daemons which are associated with a package. It is executed before the removal of files associated with the package.

**postrm** – this script typically modifies links or other files associated with foo, and/or removes files created by the package.

## Basic Build Instructions

``` bash
./build-zmq.sh
./build-pkg.sh
```

## Check

You can double check your package with: `dpkg-deb --info <deb file>`

```bash
pi@zoidberg zeromq $ dpkg-deb --info zeromq-kevin.deb 
 new debian package, version 2.0.
 size 4394058 bytes: control archive=553 bytes.
     269 bytes,     7 lines      control              
       6 bytes,     1 lines      install              
     153 bytes,    10 lines   *  postinst             #!/bin/bash
 Package: zeromq-kevin
 Architecture: all
 Maintainer: Kevin
 Depends: debconf (>= 0.5.00), libc6 (>= 2.7), libgcc1 (>= 1:4.4.0), libpgm-5.1-0 (>= 5.1.116~dfsg), libsodium13 (>= 0.6.0), libstdc++6 (>= 4.9)
 Priority: optional
 Version: 4.2.1
 Description: Kevin's zmq library
 ```

## Install

`sudo dpkg -i <deb file>`

## References

 [Package setup details](https://www.leaseweb.com/labs/2013/06/creating-custom-debian-packages/)
 
# Repository

## Packagecloud.io

I have been using [packagecloud.io](https://packagecloud.io) instead of setting up a repo myself.
It is still too early to know if it is a good move or not.
In order to install a deb repo, first you need to install the GPG key that used to sign 
repository metadata. You do that using a utility called apt-key.

    curl -L https://packagecloud.io/walchko/robots/gpgkey | sudo apt-key add -

Refresh your package cache by running:

    sudo apt-get update

If you are running Debian, install debian-archive-keyring so that official Debian 
repositories will be verified:

    sudo apt-get install debian-archive-keyring

Install a package called apt-transport-https to make it possible for apt to fetch 
packages over https.

    sudo apt-get install -y apt-transport-https

Create a file named /etc/apt/sources.list.d/walchko_robots.list that contains the repository 
configuration below.

Make sure to replace ubuntu and trusty in the config below with your Linux distribution 
and version:

    deb https://packagecloud.io/walchko/robots/raspbian/ jessie main
    deb-src https://packagecloud.io/walchko/robots/raspbian/ jessie main

Valid options for os and dist parameters can be found in our support OS list in the docs.

Run:

    sudo apt-get update

to update your local APT cache.

You can now install packages from your repository.
