Protect your Raspberry Pi µSD card (use read-only filesystem)
=============================================================

**WARNING!! EXPERIMENTAL SETTINGS: create a backup copy of your µSD card before applying these settings!**

* makes filesystem read only to prevent filesystem corruption after power fail
* overlay filesystem in RAM stores writes to µSD card 

Make Filesystem Read-Only
-------------------------------
```
sudo bash
cd /tmp
wget https://raw.githubusercontent.com/britnex/raspberrypi/master/read-only/install-experimental.sh -O install-experimental.sh
bash install-experimental.sh
```
