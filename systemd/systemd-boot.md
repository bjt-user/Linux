## general info

```
man systemd-boot
```

Systemd-boot is not a boot loader, it is a "boot manager".\
It renames the compressed linux kernel vmlinuz to vmlinuz.efi \
copies it into the boot or efi partition and uses the kernel itself as a bootloader.
