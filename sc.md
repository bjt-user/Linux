#### documentation

https://en.wikipedia.org/wiki/Sc_(spreadsheet_calculator) \
https://www.economics.utoronto.ca/jfloyd/stats/minmansc.pdf

enter this command if `sc` is installed:
```
sc /usr/share/doc/sc/tutorial.sc
```

#### installation

```
sudo pacman -S sc
```

```
man sc
```

#### navigation

Vim key bindings or arrow keys.

#### enter number into cell

In command mode hit `=` then enter the number \
then hit `enter`.

#### enter strings

`<` for left aligned string.\
`>` for right aligned string.

Hitting `"` does not work...which should create centered string

#### enter formulas

Hit `=` in command mode.\
Enter `A1+A2` to add cells.\
Hit `enter`.

Sum of a range of cells:
`@sum(B1:B3)`

#### save file

`P` then enter the file name and hit `enter`.

#### quit

`q`

#### save and quit

`ZZ`

#### TODO: do not write a backup file myfile.sc~
