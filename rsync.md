rsync [Quelle] [Ziel]

https://wiki.archlinux.org/title/Rsync

https://wiki.archlinux.org/title/Rsync#Full_system_backup

"~" funktioniert nicht, man muss "/home/bf" nutzen

example to back up a folder on a second pc:
```
rsync -aAxv --delete /home/bf/Documents bf@[hostname]:/home/bf
```
or (what I did before I knew you could just use the hostname...):
```
rsync -aAxv --delete /home/bf/Documents bf@[ip-address of the other pc]:/home/bf
```
to get the ip of the second pc type: `hostname -I` on that pc\
(but just using the hostname is way better)

***

Neues Problem nach Ubuntu-Neuinstallation und Wifi-Chipwechsel:

ssh: connect to host 192.168.*.*** port 22: Connection refused
rsync: connection unexpectedly closed (0 bytes received so far) [sender]
rsync error: unexplained error (code 255) at io.c(235) [sender=3.1.3]

=> Lösung: Ich musste auf dem Ubuntu-Laptop erst wieder den "openssh-server" installieren.
sudo apt install openssh-server

#### human readable

try the `-h` flag to make it more human readable.\
Should change bytes to MegaBytes at the end.

#### less output

Try `--quiet` flag to produce less output.

