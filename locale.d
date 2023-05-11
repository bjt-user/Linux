## troubleshooting

#### man-pages

trying to open man pages resulted in error:
```
man: can't set the locale; make sure $LC_* and $LANG are correct
```

to solve that:
```
sudo vim /etc/locale.gen
```
comment out the line with `en_US.UTF-8` (it should be the only uncommented line)

then run:
```
sudo locale-gen
```
