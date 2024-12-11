## installation

First install `xorg`.

```
sudo pacman -S gnome
```

A `sudo startx` did not bring me into `gnome`...\
A reboot did not do that either...

```
sudo systemctl enable gdm
```

```
sudo reboot
```

Then you will boot into gnome.

## configuration

Also see this:\
[gsettings.md](gsettings.md)

#### dconf and gsettings

GSettings is a high-level API for application settings, front end for dconf.

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/browsing-gsettings-values-for-applications

```
sudo dnf install dconf-editor
```
=> helpful tool

You can also use the `dconf` command:
```
dconf list /apps/seahorse/
```
But it is not clear what the "schema" is.\
The dconf dir is something else.\
And I dont know where in the system it is.

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

#### changing window managers keyboard shortcuts with gsettings

```
$ gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
$ gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
$ gsettings get org.gnome.desktop.wm.keybindings switch-to-workspace-1
['<Super>1']
$ gsettings get org.gnome.desktop.wm.keybindings switch-to-workspace-2
['<Super>2']
```
But it did not take effect.\
Because <kbd>super</kbd>+<kbd>1</kbd> was now used for two things.

Setting the switch-to-application-n to nothing:
```
$ gsettings set org.gnome.shell.keybindings switch-to-application-1 "['']"
$ gsettings set org.gnome.shell.keybindings switch-to-application-2 "['']"
```

=> that worked

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

Gnome does not want empty workspaces, so you cant create workspace 3 if there is nothing in workspace 2.

These are the default keybindings: (I showed above how to change them with `dconf-editor` or `gsettings`)

<kbd>super</kbd> + <kbd>page up/down</kbd> to switch to another workspace\
=> if there is no other workspace you get into an empty workspace\
=> once you open an application in that empty workspace it becomes a new workspace

you can move a window to the next workspace with <kbd>super</kbd> + <kbd>shift</kbd> + <kbd>page up/down</kbd> \
(click on it to make sure it is selected first)

***
### gnome extensions

This gui tool really make managing (enabling/disabling) gnome extensions easier:
```
sudo dnf install gnome-extensions-app
```

This is how to do it on the cli:

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
gnome-extensions list --enabled
```
to see all enabled extensions

to disable an extension:
```
gnome-extensions disable [extension name]
```

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

Then log out and log in again.

#### outdated extensions

With the upgrade to Fedora 37 and Gnome 43 most gnome-extensions changed to status: out of date.
```
$ gnome-extensions show no-overview@fthx 
no-overview@fthx
  Name: No overview at start-up
  Description: No overview at start-up. For GNOME Shell 40+.
  Path: /home/bofo@cpbs.at/.local/share/gnome-shell/extensions/no-overview@fthx
  URL: https://github.com/fthx/no-overview
  Version: 11
  State: OUT OF DATE
```

#### gnome tweaks

with the application `gnome tweaks` you can configure startup applications.\
But you can't configure on which screen/workspace they appear.

They seem to appear where they were at shutdown time.

---

#### notifications

In Fedora 37 there was the tool `zenity` installed.

```
$ zenity --info --text="Backup completed!"
```

```
$ zenity --notification --text="Backup completed!"
```

or this also works:
```
notify-send "job finished"
```
