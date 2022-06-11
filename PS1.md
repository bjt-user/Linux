PS1 can be configured in `~/.bashrc`. (there are PS1 settings for colored terminals and for uncolored terminals)
```
cat ~/.bashrc | grep -n "PS1"
```

bold white current working directory:
```
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;37m\]\w\[\033[00m\]\$ '
```
white current working directory and a space before and after the `$`:
```
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[97;37m\]\w\[\033[00m\] \$ '
```

backgrounds:\
40  = black background\
41  = red background\
42  = green background\
43  = orange background\
44  = blue background\
45  = purple background\
46  = cyan background\
47  = grey background\
100 = dark grey background\
101 = light red background\
102 = light green background\
103 = yellow background\
104 = light blue background\
105 = light purple background\
106 = turquoise background\
107 = white background

foregrounds:\
01 = bold white\
30  = black\
31  = red\
32  = green\
33  = orange\
34  = blue\
35  = purple\
36  = cyan\
37  = grey\
90  = dark grey\
91  = light red\
92  = light green\
93  = yellow\
94  = light blue\
95  = light purple\
96  = turquoise\
97  = white
