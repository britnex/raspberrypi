#!/bin/bash

clear
WELCOME="This script activates read-only filesystem overlay\n
continue installation?"

if (whiptail --title "Read-only Filesystem Installation Script" --yesno "$WELCOME" 20 60) then
    echo ""
else
    exit 0
fi

sed -i '1 s/^/overlay=yes /' /boot/cmdline.txt 

wget -nv https://raw.githubusercontent.com/britnex/raspberrypi/master/read-only/hooks_overlay -O /etc/initramfs-tools/hooks/overlay
wget -nv https://raw.githubusercontent.com/britnex/raspberrypi/master/read-only/init-bottom_overlay -O /etc/initramfs-tools/scripts/init-bottom/overlay

mkinitramfs -o /boot/initramfs.gz
echo "initramfs initramfs.gz followkernel" >>/boot/config.txt

if (whiptail --title "Read-only Filesystem Installation Script" --yesno "Installation completed! reboot required\n\nreboot now?" 12 60) then
    reboot
fi
