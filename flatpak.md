https://wiki.archlinux.org/title/Flatpak

## flatpak setup

Flatpak is a utility for software deployment and package management for Linux.\
It is advertised as offering a sandbox environment in which users can run application software in isolation from the rest of the system.

https://flatpak.org/setup/

```
sudo apt install flatpak
```

flathub.org has a lot of flatpak apps you can install.\
It also has the commands for installing and running the apps.

You have to enable `flathub` so you can pull from it:
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

```
sudo apt install gnome-software-plugin-flatpak
```
=> no idea what that does...

#### example: agenda installation
```
flatpak install flathub com.github.dahenson.agenda
```
confirmed with yes two times...
```
flatpak run com.github.dahenson.agenda
```
that works.

You can also just hit <kbd>super/window</kbd> and type `agenda` to run it.

#### managing flatpaks

To list all the added repositories do:
```
flatpak remotes
```

show all installed flatpaks:
```
flatpak list
```
This includes installed `runtimes` that are necessary to run an application.


#### todo

how to uninstall an application?

https://fostips.com/remove-flatpak-apps-free-up-disk/
