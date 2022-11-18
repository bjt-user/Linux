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
