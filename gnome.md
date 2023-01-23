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
keyboard -> view and customize shortcuts -> system -> lock screen (default: <kbd>super</kbd> + <kbd>l</kbd>)

***
#### workspaces

<kbd>super</kbd> + <kbd>page up/down</kbd> to switch to another workspace\
=> if there is no other workspace you get into an empty workspace\
=> once you open an application in that empty workspace it becomes a new workspace

you can move a window to the next workspace with <kbd>super</kbd> + <kbd>shift</kbd> + <kbd>page up/down</kbd> \
(click on it to make sure it is selected first)

***
### gnome extensions

```
gnome-extensions list
```
to see all installed gnome extensions

```
gnome-extensions list --disabled
```
to see all disabled extensions

and
```
--enabled
```
to see all enabled extensions

to disable an extension:
```
gnome-extensions disable [extension name]
```

If you have enabled an extension you probably need to reboot to make it active.

#### installation of an extension

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

#### gnome tweaks

with the application `gnome tweaks` you can configure startup applications.\
But you can't configure on which screen/workspace they appear.

They seem to appear where they were at shutdown time.

---
