# A non-rogue captive portal for Raspberry Pi

This is a fork of the rogue captive portal code as it was the best capitve portal I could find.

It sets up an AP, after which the flask instance on the main cosmic pi raspberry repo will serve the interface.

Installation after a fresh install of Rasbian Jessie Lite:
```
sudo apt-get install git
git clone https://github.com/CosmicPi/cosmic-captive
cd cosmic-captive
chmod +x install.sh
sudo ./install.sh
sudo reboot
```
Macchanger, apache and php have been cut, since we don't need them.

After reboot, look for an access point named "CosmicPi" Connecting to it from an Apple or Android device should automatically bring up a captive portal login screen.

Credentials are no longer logged, as all http hosting (apache/php) has been removed and is covered by flask.
