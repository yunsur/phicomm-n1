# Phicomm-N1
Armian for Phicomm N1

## What do you need to get started?

- x64 machine with at least 2GB of memory and ~35GB of disk space for a VM, native OS
- Ubuntu Hirsute 21.04 x64 for native building
  - Hirsute is required for newer non-LTS releases.. ex: Bullseye, Sid, Groovy, Hirsute
  - If building for LTS releases.. ex: Focal, Bionic, Buster, it is possible to use Ubuntu 20.04 Focal, but it is not supported
- superuser rights (configured sudo or root access).

## How to start?
### Native and VirtualBox environments:
Login as root and run:
```text
apt-get -y -qq install git
git clone --depth 1 https://github.com/yunsur/phicomm-n1.git
cd phicomm-n1
```

### Build parameter examples

```text
./compile.sh \
BOARD=phicomm-n1 \
BRANCH=current \
RELEASE=bullseye \
BUILD_MINIMAL=no \
BUILD_DESKTOP=no \
KERNEL_ONLY=no \
KERNEL_CONFIGURE=no \
COMPRESS_OUTPUTIMAGE=sha,img \
ENABLE_EXTENSIONS=bluez-firmware
```
