## general info

You do NOT need the `eduvpn` client.\
You can use `openvpn`.

Information about the aweful client, that only works with `NetworkManager`.

https://docs.eduvpn.org/server/v3/source-code.html

https://docs.eduvpn.org/server/v3/source-code.html#linux

https://codeberg.org/eduVPN/linux-app

4700 lines of python.

## usage (openvpn) - SUCCESS

```
sudo pacman -S openvpn
```

Go to eduvpn.th-ab.de -> accept.

Then you can download a "configuration".\
Select "Openvpn (bevorzuge TCP)".\
Give it a name and click on "herunterladen".

Put that config file into `/etc/openvpn/client`.

```
sudo -i
```
As root(!) do:
```
openvpn /etc/openvpn/client/name_of_your_config_file.ovpn
```
=> this worked

Now this page https://search.lib.th-ab.de/vufind/ tells me that I have \
access!

## UNNECESSARY: installation

#### pip install (DO NOT DO THIS)

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

## NetworkManager (FAIL)

The package `networkmanager` does not conflict with `systemd-networkd`,\
so maybe it can be installed alongside `systemd-networkd`.

As soon as I start `NetworkManager` network is dead because I use \
`systemd-networkd`.

## systemd-networkd

https://docs.eduvpn.org/server/v3/systemd-networkd.html

## server discovery

By running `eduvpn-cli` in debugging mode I found this URL:\
https://disco.eduvpn.org/v2/server_list.json

Filter the json for your college or city name.\
And there you have the `base_url` for every server.\

You can also search for your institution here:\
https://disco.eduvpn.org/v2/

## usage eduvpn-cli (FAIL)

#### FAIL: connect

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
