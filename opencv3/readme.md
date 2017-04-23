# OpenCV 3.x

## Build

Debian gods have removed ffmpeg from Jessie, so to fix it (only do this once):

	./fix-ffmpeg.sh

FFmpeg 2.2.2 is available via the Multimedia Repository, so we have to
add the repo to our system, update the local repo index and install the
`deb-multimedia-keyring` and `ffmpeg` packages. Like this::

	$ sudo sh -c 'echo "deb http://www.deb-multimedia.org jessie main" >> /etc/apt/sources.list'
	$ sudo apt-get update
	$ sudo apt-get install deb-multimedia-keyring
	$ sudo apt-get install ffmpeg
  
Now you system is good. Next:

	./build-opencv.sh
	./build-pkg.sh

## Install

	dpkg -i libopencv-kevin.deb


---

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" align="middle"/></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
