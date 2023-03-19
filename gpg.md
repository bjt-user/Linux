```
man gpg
```

```
man gpg-agent
```

gpg - OpenPGP encryption and signing tool

`--full-gen-key` : Generate a new key pair with dialogs for all options.


There should be a way so that you automatically login into gpg when you log into your computer.

#### show public keys

List public keys (yours and other people's keys)
```
gpg --list-keys
```

to show a specific key:
```
gpg --list-keys [name/or email of that key]
```

#### show private keys

```
gpg --list-secret-keys
```

#### decrypt a key

Also using the verbose flag:
```
gpg -v -d ~/.password-store/somewebsite.com.gpg
```

#### keyring

This seems to be a keyring:
`~/.gnupg/pubring.kbx`
It is a binary file.
```
$ file pubring.kbx
pubring.kbx: GPG keybox database version 1, created-at Fri May 28 08:04:19 2021, last-maintained Fri May 28 08:04:19 2021
```

#### gpg-preset-passphrase

Is usually not in the path, so must be executed with the full path:
```
/usr/lib/gnupg/gpg-preset-passphrase
```

```
man gpg-preset-passphrase
```

TODO: figure out how to get the `cache-id`


***
## troubleshooting

#### arch: prompt for passphrase is broken

reboot helped, but is there a way to change this aweful prompt?

The prompt seems to be done by gpg-agent
