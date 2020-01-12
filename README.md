# Welcome to tools-anchor5 !
Anchor5 is ARM quad core SoM based open hardware platform.
The tools-anchor5 include tools for download and update firmware on Anchor5 .  You can find detail information for Tizen OS on this web site.
> www.dignsys.com

Anchor5 support Tizen OS. You can find detail information for Tizen OS on this web site.
> https://www.tizen.org/

The directory structure to handle Anchor5 firmware is followed.
>  **Tizen-Work-boot**
>    - tools-anchor5   
>    - boot-firmwares-anchor5
>    - anchor5-tizen-images
>    - result

# How to tools-anchor5
## 1. Create working directory
```
$ cd ~/
$ mkdir -p ~/anchor/Tizen-Work-boot
$ cd ~/anchor/Tizen-Work-boot
```

## 2. Download tools-anchor5 & boot firmware
```
$ git clone https://github.com/dignsys/tools-anchor5.git
$ git clone https://github.com/dignsys/boot-firmwares-anchor5.git
$ git clone https://github.com/dignsys/tizen-images-anchor5.git
$ wget http://download.tizen.org/releases/daily/tizen/5.5-unified/tizen-5.5-unified_20191203.1/images/standard/iot-headed-3parts-armv7l-artik530_710/tizen-5.5-unified_20191203.1_iot-headed-3parts-armv7l-artik530_710.tar.gz
```

## 3. Install boot firmware binary
```
$ mkdir -p ~/anchor/Tizen-Work-boot
$ cd ~/anchor/Tizen-Work-boot
$ mkdir -p result
$ cd result
$ cp ../ boot-firmwares-anchor5/files/* .
$ tar zxvf ../ tizen-images-anchor5/tizen-unified_iot-boot-armv7l-artik530-anchor5.tar.gz
$ tar zxvf ../ tizen-unified_20191203.1_iot-headed-3parts-armv7l-artik530_710.tar.gz
```

## 4. USB download : first boot with new board
This is used at first boot with new board or recovery for damaged board only, you can use **fastboot** or **thordown** after fuse boot image after USB boot download.

**Target Board Console**
Change boot mode switch to USB boot. You can see board manual for USB boot.

**Host computer**
```
$ cd ~/anchor/Tizen-Work-boot
$ ./tools-anchor5/scripts/uboot-usb-download.sh
```
The board with start boot loader(u-boot), you can use **fastboot** for fusing fist Tizen image with pre-defined partition information.

## 5. Flash image by fastboot tool

**Target Board Console**
```
artik530> fastboot 0
```

**Host computer**
```
$ cd ~/anchor/Tizen-Work-boot
$ ./tools-anchor5/scripts/fastboot-download.sh
```

## 6. Flash image by lthor tool
The **lthor** is tool for download Tizen image to target board.
you can install **lthor** tool by following way.
```
$ sudo apt-get install lthor
```

You can download boot image and tizen image by use "thordown" image by following way.

**Target Board Console**
```
artik530# thordown
TIZEN "THOR" Downloader
```

**Host computer**
You can start **lthor** on the directory you have images.
```
$ cd ~/anchor/Tizen-Work-boot/result
$ sudo lthor tizen-unified_iot-boot-armv7l-artik530.tar.gz tizen-unified_20191203.1_iot-headed-3parts-armv7l-artik530_710.tar.gz
```

# Post Install
## Install packages for Tizen
We need to install additional package for Tizen OS such as GPU(gl-ddk), Peripheral I/O, Bluetooth, WLAN, Multimedia.
You can find addition packages on **tizen-image-anchor5/RPMS**.
```
$ cd ~/anchor/Tizen-Work-boot/tizen-image-anchor5/RPMS
$ ls
bluetooth-firmware-bcm-0.2.1-1.armv7l.rpm
bluez-test-5.50-5.1.armv7l.rpm
capi-system-peripheral-io-0.1.0-0.armv7l.rpm
capi-system-peripheral-io-test-0.1.0-0.armv7l.rpm
mmfw-sysconf-target-artik530-0.2.134-0.armv7l.rpm  
rfkill-0.4-2.10.armv7l.rpm
wlandrv-plugin-tizen-ap6335-1.0.0-0.armv7l.rpm 
peripheral-bus-0.1.0-0.armv7l.rpm                  
bt-anchor7                                  
gl-ddk                                             
pkg_install.sh
```
We use **sdb** tool for install package on host computer. you can check **sdb** connection as following.
```
$ sdb devices
List of devices attached
0001-anchor5            device          artik
```
You can install packages by script **pkg_install.sh**.
```
$ sh pkg_install.sh
```
The Anchor5 will restart automatically after install all packages.
