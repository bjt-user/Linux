https://neomutt.org/guide/intro

```
$ apt list neomutt
Listing... Done
neomutt/focal 20191207+dfsg.1-1.1 amd64
```

It uses `~/.muttrc` as config file.

But there is still the unsolveable barrier of this error:
```
gnutls_handshake: An unexpected TLS packet was received
```


#### todo: install from source

maybe thatll work

```
sudo git clone https://github.com/neomutt/neomutt.git /opt/neomutt
```

but the `./configure` will fail


#### fails

Debian says `gnutls_handshake: An unexpected TLS packet was received`.\
Arch Linux Container says: `login failed`.