# node_debian_pkg

Create a node.js debian package for Rasbian. Unfortunately, debian only has old packages in their repository.

## To Update

* Download the current version of [node](https://nodejs.org/en/download/current/) (either ARMv6 or ARMv7)
* Unpack it in the git repository so now you have something like `node-v7.0.0-linux-armv6l` in `node_debian_pkg`
* Copy the Debian folder (in the old version) over to the new version
  * Update `DEBIAN/control` to the new version
* Move all of the package folder (e.g., `bin`, `lib`, etc) under a new directory you make `usr/local`
* Then cd back up to the `node_debian_pkg` directory
* Issue the command `build-pkg.sh` which will:
    * fix permissions on control files in `node-pkg/DEBIAN`
    * `dpkg-deb --build node-pkg` (or whatever the current node version is)
    * copies the package to `../debian_packages` for safe keeping
* To install do: `sudo dpkg -i node-pkg.deb`

## Versions


| RPi Ver | Arch  |
|---------|-------|
| RPi 1   | ARMv6 |
| RPi 2/3 | ARMv7 |

## Licenses

Any code/scripts I have made are MIT while any documentation I have made are CC-BY-SA-4.0. Node is licensed under its own stuff, see downloaded binary for that.

----

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
