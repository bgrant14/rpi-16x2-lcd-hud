# Raspberry Pi 16x2 LCD HUD
An HUD to be displayed on a 16x2 screen connected to a Raspberry Pi. Line 1: weather at my location. Line 2: network usage of my Plex server.

## Dependencies
The deprecated [Adafruit Python CharLCD](https://github.com/adafruit/Adafruit_Python_CharLCD.git) (I should probably update that), ifstat on the server being monitored, python, bash, and other basic Unix utilities.

## Usage
The display can be connected to the Pi according to [this guide](https://pimylifeup.com/raspberry-pi-lcd-16x2/). The 'netTemp.sh' and 'scroll.sh' scripts should be in a directory specified in the $PATH variable. Once that is done, simply run 'hud.sh'.
