# LoWUSB

Low-power Wireless USB using CC2531 USB Dongle + Contiki-OS

# Tested Environments

- macOS Monterey 12.4

# Setup

## Clone the repository

```sh
git clone --recursive git@github.com:fetiu/lowusb.git
```

## Prepare CC-Debugger tool

```sh
cd cc-tool
./bootstrap
./configure
make
```

Then, test flashing a example binary.

```sh
./cc-tool -ew ../CC2531ZNP-Prod.hex
```

If it succeeds, a serial port will be detected.

Now, please move binary to system directory for convenience.

```sh
mv cc-tool /usr/local/bin
```

## Build SDCC Compiler

CC2531 USB Dongle is based on Intel 8051, so it requires special c compiler called SSDC.

```sh
cd sdcc
./sdcc-contiki.sh
```

> Refer below for troubleshooting
> - https://github.com/contiki-os/contiki/wiki/8051-Requirements
> - https://github.com/ekawahyu/sdcc-CC2530/blob/master/sdcc-build-osx.sh
> - https://github.com/contiki-os/contiki/wiki/8051-Based-Platforms#guides

## Build an exmaple

```sh
cd contiki/examples/cc2530dk
make
cc-tool -ew blink-hello.hex
```
