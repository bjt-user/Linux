only show files (with hidden files) (ignore directories)
```
ls -lap | grep -v /
```
(ls -p adds "/" to directories)

list only directories:
```
ls -d */
```

#### How to adjust the colors of ls

First of all there is the
```
dircolors
```
command.

```
dircolors --print-database > ~/.dir_colors
```

change the colors inside that file\
apply the changes:

```
eval $(dircolors ~/.dir_colors)
```

for persistent use put this in bashrc:
```
if [ -f ${HOME}/.dir_colors ]; then
  eval $(dircolors ~/.dir_colors)
fi
```

***

manually setting certain colors:
```
LS_COLORS='di=0;31'; export LS_COLORS
```
The di=1;31 bit tells ls that directories (di) are bold (1;) red (31).

=> that worked instantly without sourcing .bashrc
```
LS_COLORS='di=0;32'; export LS_COLORS
```
=> ist fürs erste ok, man könnte vll noch den Hintergrund ändern bei den directories
```
LS_COLORS='di=0;32;107'; export LS_COLORS
```
=> directories with white background an green forground

directories with grey background and black foreground:
```
LS_COLORS='di=0;30;47'
```

Blue = 34
Green = 32
Light Green = 1;32
Cyan = 36
Red = 31
Purple = 35
Brown = 33
Yellow = 1;33
Bold White = 1;37
Light Grey = 0;37
Black = 30
Dark Grey= 1;30

The first number is the style (1=bold), followed by a semicolon, and then the actual number of the color, possible styles (effects) are:

0   = default colour
1   = bold
4   = underlined
5   = flashing text (disabled on some terminals)
7   = reverse field (exchange foreground and background color)
8   = concealed (invisible)

The possible backgrounds:

40  = black background
41  = red background
42  = green background
43  = orange background
44  = blue background
45  = purple background
46  = cyan background
47  = grey background
100 = dark grey background
101 = light red background
102 = light green background
103 = yellow background
104 = light blue background
105 = light purple background
106 = turquoise background
107 = white background

All possible colors:

30  = black
31  = red
32  = green
33  = orange
34  = blue
35  = purple
36  = cyan
37  = grey
90  = dark grey
91  = light red
92  = light green
93  = yellow
94  = light blue
95  = light purple
96  = turquoise
97  = white

These can even be combined, so that a parameter like:

di=1;4;31;42

in your LS_COLORS variable would make directories appear in bold underlined red text with a green background!

my favorite for directories (black color on dark grey background):
LS_COLORS='di=0;30;100'; export LS_COLORS


#### How to source .bashrc (so it takes effect without restarting shell)

```
. ~/.bashrc
```
