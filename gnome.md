Also see this:\
[gsettings.md](gsettings.md)

#### custom keyboard shortcuts

press the down arrow at the right upper corner of the screen\
-> settings -> keyboard shortcuts -> scroll down and hit the `+`\
add a name for your custom shortcuts\
then the command that shall be executed\
then the keys to press for it

useful shortcuts:\
full screen terminal\
gnome-terminal --full-screen\
super + enter

#### window manager

the window manager is called `Mutter`.

<kbd>super</kbd> + <kbd>arrowkeys</kbd> move window to the right/left or maximize window\
<kbd>super</kbd> + <kbd>shift</kbd> + <kbd>arrowkeys (right/left)</kbd> move window to a different screen

***

#### lock screen

Click in the upper right corner and hit `settings` to go into the gnome settings\
keyboard -> view and customize shortcuts -> system -> lock screen (default: super + l)

***
#### gnome extensions

```
gnome-extensions list
```
to see all installed gnome extensions

You can install extensions via browser but that seems weird.\
You can also download a `.zip` by selecting `shell version` and `extension version`.
(i think they mean gnome version with "shell version")

https://extensions.gnome.org/extension/4099/no-overview/

I just clicked on install browser extension then clicked on install then turned it on and then it downloaded and installed itself.\
For manual download and install you need to know the gnome shell version which you can see in settings -> about.

Looks like you can just put a folder that is named like this: `multi-monitors-add-on@spin83` into here:
```
/home/myuser/.local/share/gnome-shell/extensions
```
(from a github repo)

then you might need to enable it
```
gnome-extensions enable multi-monitors-add-on@spin83
```
