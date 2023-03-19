```
man gpg
```

```
man gpg-agent
```

gpg - OpenPGP encryption and signing tool

`--full-gen-key` : Generate a new key pair with dialogs for all options.


There should be a way so that you automatically login into gpg when you log into your computer.

List public keys (yours and other people's keys)
```
gpg --list-keys
```

## troubleshooting

#### arch: prompt for passphrase is broken

reboot helped, but is there a way to change this aweful prompt?

The prompt seems to be done by gpg-agent
