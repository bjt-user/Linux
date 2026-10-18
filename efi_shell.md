## general info

https://uefi.org/sites/default/files/resources/UEFI_Shell_2_2.pdf

https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#UEFI_Shell

## how to get into efi shell

The Arch Linux install medium has an option called "EFI shell".

## usage

#### -b

https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#Important_UEFI_Shell_commands

> UEFI Shell commands usually support -b option which makes output pause \
after each page.

#### dump a list of current boot entries

```
Shell> bcfg boot dump -v
```

#### running file system commands

> Before running file system commands such as cd or ls, \
you need to change the shell to the appropriate file system by typing its name:

```
Shell> FS0:
FS0:\> cd EFI/
```
