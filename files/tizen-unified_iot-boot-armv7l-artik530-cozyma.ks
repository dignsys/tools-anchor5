# -*-mic2-options-*- -A armv7l -f loop --pack-to=@NAME@.tar.gz -*-mic2-options-*-

# 
# Do not Edit! Generated by:
# kickstarter.py
# 

lang en_US.UTF-8
keyboard us
timezone --utc Korea/Seoul
part /boot --fstype="ext4" --size=64 --ondisk=mmcblk0 --active --label boot --fsoptions=defaults,noatime
part /lib/modules --fstype="ext4" --size=64 --ondisk=mmcblk0 --active --label modules --fsoptions=defaults,noatime


rootpw tizen 
xconfig --startxonboot
bootloader  --timeout=3  --append="rw vga=current splash rootwait rootfstype=ext4"   --ptable=gpt --menus="install:Wipe and Install:systemd.unit=system-installer.service:test"

desktop --autologinuser=guest  
user --name guest  --groups audio,video --password 'tizen'


repo --name=local --baseurl=file:///home/hbahn/work2/GBS-ANCHOR5-ROOT/tizen_anchor5/local/repos/tizen_anchor5/armv7l/ --priority=1

repo --name=unified-standard --baseurl=http://download.tizen.org/releases/milestone/tizen/unified/latest/repos/standard/packages/ --ssl_verify=no
repo --name=base-standard --baseurl=http://download.tizen.org/releases/milestone/tizen/base/latest/repos/standard/packages/ --ssl_verify=no

%packages

# @ IoT Boot Artik 530
artik530-raptor-linux-kernel
artik530-raptor-linux-kernel-modules
anchor5-boot-firmware
#u-boot-artik530
# Others




%end


%attachment
#/u-boot/bl1-emmcboot.bin
#/u-boot/loader-emmc.img
#/u-boot/bl_mon.img
/u-boot/bootloader.img
/u-boot/params.bin

/boot/zImage
/boot/s5p4418-artik530-raptor-rev00.dtb
#/boot/s5p4418-artik530-raptor-rev03.dtb
#/boot/logo.bmp
#/boot/uInitrd
%end

%post

%end

%post --nochroot

%end

%runscript

%end

