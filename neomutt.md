#### resources

https://neomutt.org/guide/intro

***

#### configuration

https://neomutt.org/guide/configuration

NeoMutt will search for a system config file in a neomutt directory in several places.\
First it searches the locations specified in the XDG_CONFIG_DIRS environment variable, which defaults to /etc/xdg.\
Next, it looks in /etc. Finally, it tries /usr/share.

There is `/etc/neomuttrc.d`. But the main config file is not inthere.

There is a `~/.config/mutt/.muttrc` and a `~/.muttrc`.

This didnt work:
```
set spoolfile = "+INBOX"
```

When I comment it out:
```
#set spoolfile = "+INBOX"
```
the mailbox is set to /var/mail/bf and there is debian stuff in there release notes...

***
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
