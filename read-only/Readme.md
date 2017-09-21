

sed -i '1 s/^/overlay=yes /' /boot/cmdline.txt 

mkinitramfs -o /boot/initramfs.gz

echo "initramfs initramfs.gz followkernel" >>/boot/config.txt



- install the two shellscripts into the appropriate places under /etc/initramfs-tools
- run update-initramfs
- put "overlay=yes" on the kernel command line
- reboot

With the overlay in place, the real root is mounted readonly on /ro.
Only the root fs is changed, other filesystems are mounted normally.

Remove "overlay=yes" (or change it to something other than yes) and reboot to go back to readwrite.
(This probably means that you want the commandline config to live somewhere other than on the root fs, e.g. under /boot)
