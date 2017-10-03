Protect your Raspberry Pi µSD card (use read-only filesystem)
=============================================================

**WARNING!! EXPERIMENTAL SETTINGS: create a backup copy of your µSD card before applying these settings!**

* makes filesystem read only to prevent filesystem corruption after power fail
* writes to µSD card are redirected to overlay filesystem in RAM 

Prerequisites:
* Raspbian Stretch with Desktop (2017-09-07)
* Raspbian Stretch Lite (2017-09-07)


Make Filesystem Read-Only
=========================
```
sudo bash
cd /tmp
wget https://raw.githubusercontent.com/britnex/raspberrypi/master/read-only/install-experimental.sh -O install-experimental.sh
bash install-experimental.sh
```


Check Read-Only Status
-----------------------
* Read only mode is enabled
```
root@raspberrypi:/home/pi# df
Filesystem     1K-blocks    Used Available Use% Mounted on
...
/dev/mmcblk0p2  15205520 4309620  10215392  30% /ro
overlay-rw        262144  115108    147036  44% /rw
...
```

* Read only mode is disabled
```
root@raspberrypi:/home/pi# df
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/mmcblk0p2  15205520 4309756  10215256  30% /
```

Make Filesystem Read-Write Again
================================

sudo nano /boot/cmdline.txt
* change *overlay=yes* to *overlay=no*
* Ctrl+o and Ctrl+x
