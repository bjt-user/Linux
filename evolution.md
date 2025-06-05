#### prevent forced line breaks when composing email
-------------------------------------------------------

Select "preformatted" paragraph style.

OR:

Edit -> Preferences -> Composer Preferences\
"Number of characters for word wrapping" (this is the amount of character after which evolution forces line breaks)

OR:

Use "html" instead of "plain text" as editing mode.

***

#### evolution outside of gnome

Without a keyring you have to type in your email password once every login.\
Then you should be able to open evolution without typing in your pw for the duration of the login session.

But you can also use gnome-keyring to unlock your password after logging in at lightdm.

From archwiki:
> Evolution relies on GNOME Keyring for storing account passwords, so to use Evolution outside of GNOME, see GNOME/Keyring#Using the keyring and make sure a password keyring with the name login exists. 

```
sudo pacman -S gnome-keyring seahorse
```

Open `seahorse` -> `+` -> "Password keyring" -> name of the keyring: "login"\
Then choose your password.

Then you need to rightclick the keyring and "set as default"!

Then reboot.\
The the keyring was "locked", I had to unlock it with the password and tick "unlock at login".\
Reboot again.\
Then start evolution, type in your email password and tick the box "add to keyring".\
And it will remember it after your next login.

***

#### calendar

Calendar data is stored in the popular `.ics` format:\
`~/.local/share/evolution/calendar/system/calendar.ics`

To delete old entries from that calendar (maybe via script in the future):\
search for the "summary" you gave for your appointment\
then you see `BEGIN:VEVENT`, and you can delete until `END:VEVENT`.\
The entries are chronological, so you search for the first `BEGIN:VEVENT` in the file and start deleting from that until a `END:VEVENT` that is still in the past and not an upcoming event.

## troubleshooting

#### keyring / evolution keeps asking for password

open `seahorse`\
right click on the "login" password\
"change password"\
enter the old password (this should be the os password for the user)\
leave the new password empty

=> that worked

#### TODO: cannot open evolution because keyring prompt freezes xorg

Currently the only way to get out is to ctrl + alt + f3 and manually kill all evolution processes.
