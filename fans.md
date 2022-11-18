# controlling computer fans - is it possible?

https://stackoverflow.com/questions/49377334/usr-sbin-pwmconfig-there-are-no-pwm-capable-sensor-modules-installed-msi-ubun

```
sudo sed -E -i 's/(GRUB_CMDLINE_LINUX_DEFAULT=.+)"$/\1 acpi_enforce_resources=lax"/' /etc/default/grub
sudo update-grub
```

then reboot

so I did that...
```
$ cat /etc/default/grub | grep -i "cmdline"
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
$ sudo sed -E -i 's/(GRUB_CMDLINE_LINUX_DEFAULT=.+)"$/\1 acpi_enforce_resources=lax"/' /etc/default/grub
$ cat /etc/default/grub | grep -i "cmdline"
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_enforce_resources=lax"
GRUB_CMDLINE_LINUX=""
```

but I still get:
```
$ sudo pwmconfig
# pwmconfig version 3.6.0
This program will search your sensors for pulse width modulation (pwm)
controls, and test each one to see if it controls a fan on
your motherboard. Note that many motherboards do not have pwm
circuitry installed, even if your sensor chip supports pwm.

We will attempt to briefly stop each fan using the pwm controls.
The program will attempt to restore each fan to full speed
after testing. However, it is ** very important ** that you
physically verify that the fans have been to full speed
after the program has completed.

/usr/sbin/pwmconfig: There are no pwm-capable sensor modules installed
```
