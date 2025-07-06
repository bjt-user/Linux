## general info

#### installation

```
sudo pacman -S aerc
```

## configuration

#### custom key bindings

In the `[view]` section put this:
```
ic = :pipe calcurse -i -
```

And then you can hit `ic` when viewing a `text/calendar` file \
to import it in `calcurse`.

## usage

#### help

`:help` or `?`

#### set up account

When you start `aerc` it instantly prompts for your email address, password and more.

You need the server addresses and protocols for your mail provider.\
Email providers usually provide this information.

#### navigation

shift + j/k to move between folders \
ctrl + arrowkeys to move between folders \
ctrl + n/p to move to next/previous tab \
j/k or arrowkeys to move to next previous mail \
gg to go to top \
G to go to bottom \
ctrl + f/b go up/down one page

#### send mail

`C`

Use `tab` to move to the next field.\
It uses vim keybindings, go in insert mode, then save with `:x`.\
Then send with `y`.

#### reply to a mail

`rq` to reply to a mail with quoting the original mail.

Or `rr` to reply without quoting the mail you are replying to.

#### viewing html only mails

Some mails seem to be readable only in html mode.\
You need to install `w3m` to read these messages:
```
sudo pacman -S w3m
```

#### selecting multiple messages

To select multiple messages (to move/archive/delete them):\
`V`

#### delete message

`d` and confirm with `y` or \
`D` to instantly delete message

#### save attachment

In the "mail view" type:
```
:save -a /tmp/
```
to save all attachments in `/tmp`.

#### send attachment

After composing the mail you are presented with options.\
Just hit `a` then you can add an attachment.\
```
:attach /tmp/myfile.txt
```
(There is completion active.)

#### move message to different folder

Move the selected message to folder "TRASH":
```
:mv TRASH
```

#### archive

Move the selected message to the `archive` dir:
```
:archive flat
```
or just hit `A`

#### click links

With ctrl + j/k you can switch between text and html.

In html mode, put the cursor on the link and type `:open` \
(or just hit `o`) and the link will open in your default browser.

#### search for unread messages

```
:search -u
```

#### search for strings in mail headers

`/searchterm` `enter`

Hit `n` for the next finding.

But it is probably better to `:filter`.

#### filter messages

`\searchterm`

Then you can select multiple mails with `V` \
and `:mv folder`.

#### save sent messages

You need to set
```
copy-to = SENT
```
in `~/.config/aerc/accounts.conf`

#### import icalendar files

You need to pipe the email to your own script to do this.

Navigate to "text/calendar" with ctrl + j.\
`:pipe tee myfile.ics`

```
:pipe calcurse -i -
```
