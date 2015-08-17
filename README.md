# dd-wrt-go
How to build naitive applications in go, then run on dd-wrt
(Specifically on a Netgear R7000)

## How it works
The Makefile does all the heavy lifting.  Notably, it sets the following:

1. Toolchain path
2. LDFLAGS to '--linkmode external --extldflags "-static"`
3. Calls go with the following variables set:
    * CC - $TOOLCHAIN/bin/whatever-gcc
    * LDFLAGS to the above
    * GOOS - linux
    * GOARCH - arm
    * GOARM=5

## Installation
For installation, all you have to do is find the toolchain, and use the magic from my Makefile.

### Install the Toolchain
You can find the tool chain from the dd-wrt site:
* http://www.dd-wrt.com/site/support/other-downloads
* Specifically: http://download1.dd-wrt.com/dd-wrtv2/downloads/toolchains/toolchains.tar.xz

The toolchain that I found to work was: **toolchain-arm_cortex-a9_gcc-4.8-linaro_musl-1.1.5_eabi**

I installed that into **/usr/local/toolchain-arm_cortex-a9_gcc-4.8-linaro_musl-1.1.5_eabi**

## Building
Building is easy enough -- just type "make" and the C and go versions of "Hello World" will be built.

## Testing
After building (type "make" after following above instructions), install the hellogo application onto your router and test it:

1. ssh into your router
2. scp the file over: ```root@router# scp dev-box:path/to/hellogo .```
3. Mark it executiable: ```root@router# chmod +x hellogo```
4. And, execute it!: ```root@router# ./hellogo```

You should see:

    root@router:~# ./hellogo
    Hello GoWorld!
    root@router:~#
