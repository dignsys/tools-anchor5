# tools-anchor

How to use tools on Anchor
1. Directory structure

  +- Tizen-Work-boot 
  
      +- tools-anchor
      
      +- boot-firmwares-anchor5
      
      +- anchor5-tizen-images
      
      +- result

2. Create working directory

  $ cd ~/
  
  $ mkdir Tizen-Work-boot
  
  $ cd Tizen-Work-boot
  

3. Download tools-anchor & boot firmwares

  $ git clone https://github.com/dignsys/tools-anchor.git
  
  $ git clone https://github.com/dignsys/anchor5-tizen-images.git
  
  $ git clone https://github.com/dignsys/boot-firmwares-anchor5.git
  

4. install boot firmware binary

  $ mkdir result
  
  $ cd result
  
  $ cp ../boot-firmwares-anchor5/* .
  
  $ tar zxvf ../anchor5-tizen-images/tizen-unified_iot-boot-armv7l-artik530.tar.gz
  
  $ tar zxvf ../anchor5-tizen-images/tizen-unified_iot-headed-3parts-armv7l-anchor5.tar.gz
  
  $ ls
  

5. USB download : first boot with new board

  $ cd ~/Tizen-Work-boot
  
  $ ./tools-anchor/scripts/uboot-usb-download.sh
  

6. Flash boot image

  < target side >
  
  artik530> fastboot 0
  
  
  < host side >
  
  $ ./tools-anchor/scripts/fastboot-boot-download.sh
  

7. Flash tizen image

  < target side >
  
  artik530> fastboot 0
  
  
  < host side >
  
  $ ./tools-anchor/scripts/fastboot-download.sh
