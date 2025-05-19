#### check if uefi or legacy bios

> The easiest way is to check to see if /sys/firmware/efi exists.\
It does not appear if you booted using traditional BIOS.

```
#!/bin/bash
[ -d /sys/firmware/efi ] && echo UEFI || echo BIOS
```
(https://askubuntu.com/questions/162564/how-can-i-tell-if-my-system-was-booted-as-efi-uefi-or-bios)

#### secure boot

find out if secure boot is enabled:
```
$ dmesg | grep -i "secure boot"
[    0.000000] secureboot: Secure boot enabled
[    0.000000] Kernel is locked down from EFI Secure Boot mode; see man kernel_lockdown.7
[    0.014155] secureboot: Secure boot enabled
[    0.798865] integrity: Loaded X.509 cert 'Fedora Secure Boot CA: ...'
[    0.799038] integrity: Loaded X.509 cert '... Secure Boot Module Signature key: ...'
[    0.799217] integrity: Loaded X.509 cert '... Secure Boot Module Signature key: ...'
```
