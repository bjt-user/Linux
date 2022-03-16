#### install wifi drivers on Ubuntu
```
lspci | grep Network
```
This command shows the wifi controller.

=> I had a broadcom bcm43142. No chance of getting that piece of shit to work...

Then I took an old HP laptop.\
Took the wifi module from the back which was easily accessible.\
Put it into my Acer laptop and the wifi worked out of the box I did not have to do anything.\
"Qualcomm Atheros AR9285 Wireless Network Adapter" works on Ubuntu 20.04 out of the box, zero installation.
