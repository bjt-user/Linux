#### BalenaEtcher

On Debian the balenaEtcher AppImage did not start.

```
./balenaEtcher-1.5.122-x64.AppImage --no-sandbox
```
=> with this command balenaEtcher works!

But what to do if the USB-stick is recognized by `lsusb` but not by `fdisk -l` or the file browser?\
Then balenaEtcher doesn't know it either...

run the following command (but don't wait for direct output)
```
sudo tail -n 0 -f /var/log/syslog
```
When you plug/unplug USB-stick messages should be printed to the terminal.

=> Fortunatelly USB-stick was recognized in file browser after unplugging and replugging.