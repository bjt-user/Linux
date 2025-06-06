## general info

#### resources

https://neomutt.org/guide/intro

IRC: libera.chat #neomutt

https://wiki.archlinux.org/title/Mutt


## usage

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

This site https://neomutt.org/test-doc/bestpractice/nativimap says to set the spool file\
to your imap server like this:
```
set spoolfile="imaps://imap.domain.tld/"
```
But I get `login failed` and `SASL authentication failed`.

This config worked for "web.de":
```
set imap_user = "user.name"
set imap_pass = "password"
set spoolfile="imaps://imap.web.de/"
set folder = "imaps://imap.web.de:993"
set smtp_url = "smtps://user.name@smtp.web.de:465"
set smtp_pass = "password"
set ssl_starttls=yes
```

***
#### debugging

`-d level`\
Log debugging output to a file (default is "~/.neomuttdebug0"). The level can range from 1–5 and affects verbosity (a value of 2 is recommended)

Using this option along with -l is useful to log the early startup process (before reading any configuration and hence $debug_level and $debug_file) 

```
$ neomutt -d 5
```
will write the logfile `~/.neomuttdebug0`.

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

#### gmail

https://github.com/neomutt/neomutt/issues/3453

It says you can create "app passwords" but only if you have 2fa enabled...

Even with 2fa I didnt find a link for this...

#### todo: install from source

maybe thatll work

```
sudo git clone https://github.com/neomutt/neomutt.git /opt/neomutt
```

but the `./configure` will fail

#### email providers

I managed to read my email with a "web.de" mail account.

```
<bf> Are there email providers that work better with neomutt?
<...> fastmail
```
https://www.fastmail.com/

```
<...> fastmail has very nice and granular app password support which also makes setting up mbsync and outbound smtp easy
```
=> when I try to register there it says "30-day trial" ...\
=> I wont use it.

## troubleshooting

Debian says `gnutls_handshake: An unexpected TLS packet was received`.\
Arch Linux Container says: `login failed`.

#### invalid credentials

I get `invalid credentials` even though the credentials are correct.

#### text/html is unsupported

I can use <kbd>v</kbd> and then <kbd>enter</kbd> to see the emails in the browser,\
and then the html is rendered correctly but that is unconvenient.

Put this in your `.muttrc`:
```
# Set preffered view modes
auto_view text/html text/calendar application/ics # view html automatically
alternative_order text/html text/plain text/enriched text/*
```
And then I could still do <kbd>v</kbd> and <kbd>enter</kbd> to render the html in the browser.

***
