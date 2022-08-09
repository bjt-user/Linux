How to get preferences in gedit (if there is no menu option for preferences)
------------------------------------------------------------------------------

gsettings set org.gnome.settings-daemon.plugins.xsettings overrides '@a{sv} {"Gtk/ShellShowsAppMenu": <int32 0>}'


Show gedit properties:
```
gsettings list-recursively | grep "gedit"
```
