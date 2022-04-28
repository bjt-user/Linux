`tmux` allows you to have multiple terminals inside one terminal session.

type `tmux` to open a terminal session.\
If you type `exit` inside that terminal session, you close the session again.

`tmux ls` shows the `tmux` terminal sessions that are currently opened.

default `prefix key` is `ctrl + b`\
(you can change that)

`ctrl + b` and then type `"` to split terminal windows horizontically.\
`prefix` and then `%`   splits terminals vertically\
`prefix` and then `arrowkey`    to switch between terminals\
`prefix` and then `c`   to open a new terminal window\
`prefix` and then `n`   to go to the next terminal window\
`prefix` and then `&`   to kill the current window (after confirmation with `y`)\
`prefix` and then `,`   to rename the current window\
`prefix` and then `d`   to close the current session\
`prefix` and then `$`   to rename the current session

`tmux attach` (or `tmux a`)  to go back into the tmux session\
`tmux a -t 1`   to go to tmux session 1 (you can see the session number with `tmux ls`)
