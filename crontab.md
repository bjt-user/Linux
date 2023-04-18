#### resources

https://wiki.archlinux.org/title/Cron

You can also use systemd as a replacement for cron:\
https://wiki.archlinux.org/title/Systemd/Timers

## installation

#### fedora

Unter `Fedora` muss erst das Paket `cronie` installiert werden.


```
systemctl enable --now crond
```

#### arch

```
sudo pacman -S cronie
sudo systemctl enable --now cronie
```

#### usage

view crontab of the current user:
```
crontab -l
```

edit the crontab of the current user:
```
crontab -e
```

## troubleshooting

### you have to escape %

**escape `%` sings with `\`!**
```
0 20 * * * /home/bf/coding/scripts/backup_cron.sh "arch-celeron" > ${HOME}/logs/backup$(date +\%Y\%m\%d).log 2>&1
```
