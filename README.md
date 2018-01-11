# A non-rogue captive portal for Raspberry Pi

This is a fork of the rogue captive portal code as it was the best capitve portal I could find. Note that the original code wasn't licensed at the time of writing - this is an open issue: 
https://github.com/braindead-sec/rogue-captive/issues/1

It sets up an AP, after which the flask instance on the main cosmic pi raspberry repo will serve the interface. Note that the IP address in this configuration is 10.0.0.1, not 192.168.12.1 as indicated on the front panel of the Cosmic Pi V1.5 units - this will be fixed in a future update of this repo.

Installation after a fresh install of Rasbian Stretch Lite:
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

Note, if a network in wpa_supplicant is found, it will drop the AP and connect. If the external network fails, then the system will remain down until the external network comes back. Alternatively if rebooted it will create the access point again if in the absence of the external network.

Credentials are no longer logged, as all http hosting (apache/php) has been removed and is covered by flask.
