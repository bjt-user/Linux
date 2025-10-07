## general info

https://github.com/BurntSushi/ripgrep

> ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern.\
By default, ripgrep will respect gitignore rules and automatically skip hidden files/directories and binary files.\
(To disable all automatic filtering by default, use rg -uuu.)

## installation

```
sudo pacman -S ripgrep
```

## usage

#### also search files/dirs that are in .gitignore

```
rg -i -u 'startsec'
```

> To disable all automatic filtering by default, use `rg -uuu`.

#### dont exclude hidden files

```
rg -. 'pattern'
```
or
```
rg --hidden 'pattern'
```

#### exclude dirs

Exclude the dirs `auto` and `testdir`:
```
rg 'more' -g '!auto/' -g '!testdir'
```
