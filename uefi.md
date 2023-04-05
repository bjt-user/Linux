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
