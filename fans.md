# controlling computer fans - is it possible?

https://stackoverflow.com/questions/49377334/usr-sbin-pwmconfig-there-are-no-pwm-capable-sensor-modules-installed-msi-ubun

```
sudo sed -E -i 's/(GRUB_CMDLINE_LINUX_DEFAULT=.+)"$/\1 acpi_enforce_resources=lax"/' /etc/default/grub
sudo update-grub
```

then reboot

