#### prevent forced line breaks when composing email
-------------------------------------------------------

Select "preformatted" paragraph style.

OR:

Edit -> Preferences -> Composer Preferences\
"Number of characters for word wrapping" (this is the amount of character after which evolution forces line breaks)

OR:

Use "html" instead of "plain text" as editing mode.

-------------------------------------------------------

#### evolution outside of gnome

From archwiki:
> Evolution relies on GNOME Keyring for storing account passwords, so to use Evolution outside of GNOME, see GNOME/Keyring#Using the keyring and make sure a password keyring with the name login exists. 

```
sudo pacman -S gnome-keyring seahorse
```

Open `seahorse` -> `+` -> "Password keyring" -> name of the keyring: "login"\
Then choose your password.

Then you need to rightclick the keyring and "set as default"!

Then start evolution, type in your email password and tick the box "add to keyring".\
And it should remember it.

BUT: evolution doesnt ask me for a password.

***

#### calendar

Calendar data is stored in the popular `.ics` format:\
`~/.local/share/evolution/calendar/system/calendar.ics`

