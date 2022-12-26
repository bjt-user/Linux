#### Sending/Receiving Emails In The Terminal?

Up to this point I was not able to send/receive emails in a terminal.\
I think I got it working some time ago with `gmail` and `python`.

**WARNING: NEVER INSTALL THE PACKAGE "QMAIL"**

#### email providers

**Gmail/Google Mail** will not allow you to sign in with an app you wrote or with neomutt etc anymore:\
> To help keep your account secure, from May 30, 2022, ​​Google no longer supports the use of third-party apps
or devices which ask you to sign in to your Google Account using only your username and password.

***
#### mutt (FAIL)
```
sudo apt install mutt
```
cd

cd .config

If there is no .config folder, create one.

mkdir mutt

cd mutt

vim muttrc

content of muttrc:

"set folder = "imaps://myname@emailservice.com@[imapservername]:[portnumber]"

"set spoolfile = "+INBOX"

mutt

gnutls_handshake: Unexpected TLS handshake...

Maybe try neomutt or a different software.

Operation manuelle Installation könnte evtl. helfen.

mutt -v zeigt u.a.:
Mutt 2.0.5 (2021-01-21)
configure options: --with-gnutls

#### neomutt (fail)

sudo apt install neomutt

same problem as in mutt
-------------------------------------------------------------------------------------------------

GUI Email-Client

[Evolution.md](evolution.md)
