## general info

https://docs.eduvpn.org/server/v3/source-code.html

https://docs.eduvpn.org/server/v3/source-code.html#linux

https://codeberg.org/eduVPN/linux-app

4700 lines of python.

## TODO: installation

#### pip install

```
pip install --user eduvpn-client --break-system-packages
```
=> Successfully installed.

```
reboot
```

Now the following commands are in the PATH:
```
eduvpn-cli
eduvpn-gui
```

```
$ eduvpn-cli
Network Manager not available
```

Both commands need the `NetworkManager`...

## NetworkManager

The package `networkmanager` does not conflict with `systemd-networkd`,\
so maybe it can be installed alongside `systemd-networkd`.

## server discovery

By running `eduvpn-cli` in debugging mode I found this URL:\
https://disco.eduvpn.org/v2/server_list.json

Filter the json for your college or city name.\
And there you have the `base_url` for every server.\

## usage eduvpn-cli

#### connect

`-s/--search`:
```
eduvpn-cli connect -s my_city
```
Then select a number if an entry was found.

Now something in the browser opened.

Click on "Accept", then on "Approve".

Then close the browser window.

Go back to the cli and enter "1".

```
2026-09-26 15:15:51,432 - MainThread - ERROR - eduvpn.nm - nm.py:1059 - add connection error: nm-client-error-quark: NetworkManager is not running (1)
```
You need to start `NetworkManager` first.

```
sudo systemctl start NetworkManager
```
Now my internet is gone because I use `systemd-networkd`.

And now I cannot resolve dns names anymore so the cli client does not work \
anymore.
