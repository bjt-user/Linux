## general info

https://uefi.org/sites/default/files/resources/UEFI_Shell_2_2.pdf

https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#UEFI_Shell

## how to get into efi shell

The Arch Linux install medium has an option called "EFI shell".

Looks like you could download EFI images here:\
https://github.com/acidanthera/OpenCorePkg/releases

And then flash those to a USB stick.

TODO: make USB stick with EFI shell.

## usage

#### -b

https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#Important_UEFI_Shell_commands

> UEFI Shell commands usually support -b option which makes output pause \
after each page.

#### help

Show all available commands:
```
help -b
```

Show help for a specific command:
```
help bcfg -b
```

#### dump a list of current boot entries

```
Shell> bcfg boot dump -v
```

#### map

`map` displays a list of device mappings i.e. the names of available \
file systems (FS0) and storage devices (blk0).

#### running file system commands

> Before running file system commands such as cd or ls, \
you need to change the shell to the appropriate file system by typing its name:

```
Shell> FS0:
FS0:\> cd EFI/
```
