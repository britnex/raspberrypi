Raspberry Pi 2B, 7" Display, Chromium Webbrowser (hardware accelerated)
=======================================================================

root@raspberrypi:/home/pi# raspi-config
* Advanced Options     Configure advanced settings  
  * GL Driver    Enable/Disable experimental desktop GL driver 
    * Would you like the experimental GL driver for desktop to 
      * **YES**
      

root@raspberrypi:/home/pi# nano /usr/local/bin/swapaxes.sh
> DISPLAY=:0 xinput set-prop 'FT5406 memory based driver' 'Evdev Axes Swap' 0
> DISPLAY=:0 xinput set-prop 'FT5406 memory based driver' 'Evdev Axis Inversion' 0 0

root@raspberrypi:/home/pi# chmod 777 /usr/local/bin/swapaxes.sh
      
root@raspberrypi:/home/pi# apt-get install chromium-browser
> nano /home/pi/.config/lxsession/LXDE-pi/autostart 
> @xset s off
> @xset -dpms
> @xset s noblank
> @/usr/local/bin/swapaxes.sh
> @chromium-browser --kiosk --ignore-gpu-blacklist --use-gl=egl --enable-native-gpu-memory-buffers --enable-zero-copy --enable-accelerated-2d-canvas https://web2.0calc.com/


Chromium address bar: chrome://flags
* Switch "Enable Touch Events" setting to **enabled**



