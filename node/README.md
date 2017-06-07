# node_debian_pkg

Create a node.js debian package for Rasbian. Unfortunately, debian only has old packages in their repository.

[Nodejs.org](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions) 
maintains packages for ARMv7 and higher. Unfortunately, Zero Pi's are ARMv6. So for ARMv7, you can do:

 curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
 sudo apt-get install -y nodejs

For ARMv6, use the packages here built using their source.

## Issues

- this file is missing: `/usr/local/lib/node_modules/npm/node_modules/glob/node_modules/fs.realpath/old.js`. Once replaced, it all works.

## To Update

* Download the current version of [node](https://nodejs.org/en/download/current/) (ARMv6 version)
* Unpack it in the git repository so now you have something like `node-v7.0.0-linux-armv6l` in `node`
* Copy the Debian folder (in the old version) over to the new version
  * Update `DEBIAN/control` to the new version number
* Move all of the package folder (e.g., `bin`, `lib`, etc) under a new directory you make `usr/local`
* Then cd back up to the `node` directory
* Issue the command `build-pkg.sh` which will:
    * fix permissions on control files in `node-pkg/DEBIAN`
    * `dpkg-deb --build node-pkg` (or whatever the current node version is)
    * copies the package to `../debian_packages` for safe keeping
* To install do: `sudo dpkg -i node-pkg-name.deb`
* Then do: `npm install npm@latest -g`

## Versions


| RPi Ver | Arch  |
|---------|-------|
| RPi 1   | ARMv6 |
| RPi 2/3 | ARMv7 |

## Licenses

Any code/scripts I have made are MIT while any documentation I have made are CC-BY-SA-4.0. Node is licensed under its own stuff, see downloaded binary for that.

----

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
