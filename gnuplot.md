## general info

http://gnuplot.info/documentation.html

The html is broken, pdf works.

#### installation

```
sudo pacman -S gnuplot
```

## usage

#### help

```
help
```

```
gnuplot> help terminal
```

#### generate a graph from points

Given this file:
```
$ cat points.dat
0 1
1 2
2 3
3 4
```

You can generate a graph:
```
gnuplot> plot "points.dat"
```
(The double quotes are critical!)

Or directly from the command line:
```
gnuplot -e "plot 'points.dat'" -p
```

#### print plot in the terminal

```
gnuplot> set terminal dumb
```

```
gnuplot> show terminal

   terminal type is dumb feed enhanced size 79, 24 aspect 2, 1 mono noattributes
```

#### set xrange, yrange

By default `gnuplot` will choose dimensions for x and y axis.

You can explicitly set the `xrange` and `yrange` before using the \
`plot` command.

```
set xrange [-1:3]
```

```
set yrange [-1:4]
```

#### show the axis

To show lines where x is 0 and y is 0:
```
set xzeroaxis
set yzeroaxis
```

This makes the graphs easier to understand.
