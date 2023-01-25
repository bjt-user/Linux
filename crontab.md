#### installation

Unter `Fedora` muss erst das Paket `cronie` installiert werden.

#### usage

```
systemctl enable --now crond
```


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
