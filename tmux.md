`tmux` allows you to have multiple terminals inside one terminal session.

type `tmux` to open a terminal session.\
If you type `exit` inside that terminal session, you close the session again.

`tmux ls` shows the `tmux` terminal sessions that are currently opened.

default `prefix key` is `ctrl + b`\
(you can change that)

`ctrl + b` and then type `"` to split terminal windows horizontically.\
`prefix` and then `%`   splits terminals vertically\
`prefix` and then `!`   popout pane (make current pane into a window) \
`prefix` and then `arrowkey`    to switch between terminals\
`prefix` and then `c`   to open a new terminal window\
`prefix` and then `n`   to go to the next terminal window\
`prefix` and then `&`   to kill the current window (after confirmation with `y`)\
`prefix` and then `,`   to rename the current window\
`prefix` and then `d`   to close the current session\
`prefix` and then `$`   to rename the current session\
`prefix` and then `s`   to switch between sessions\
`prefix` and keep holding `ctrl` then use arrowkeys     to resize the pane

`tmux attach` (or `tmux a`)  to go back into the tmux session\
`tmux a -t 1`   to go to tmux session 1 (you can see the session number with `tmux ls`)\
`tmux new -s "monitor"`  to create a new session and give it the new "monitor"\
`tmux kill-server`    to kill all sessions

#### customize tmux

```
tmux kill-server
touch ~/.tmux.conf
```
To change the prefix keys write this section:
```
# set prefix
set-option -g prefix C-a
unbind-key C-a
bind-key C-a send-prefix
```
(but I think `ctrl+b` is better than `ctrl+a`)

switch panes with `ctrl + h/l/k/j` (this will conflict with my vim configuration)\
(but maybe you dont need to open two vim files in one window when you use tmux)
```
# switch panes
bind -n C-h select-pane -L
bind -n C-l select-pane -R
bind -n C-k select-pane -U
bind -n C-j select-pane -D
```
#### converting panes to windows and converting windows to panes

Let's say you have two panes.\
You typed `tmux` and then did `prefix + %` to have a vertical split.\
Now you can do `prefix + :` to get into the command mode.\
Then type `break-pane` hit enter and you will have two windows instead of two vertically split panes.\
Or just do `prefix + !` to pop out the current pane.

To do the opposite, make 2 windows into 1 window with 2 panes I did this:
```
join-pane -s 1 -t 0 
```
The 1 seems to stand for window number 1 and the 0 for window number 0.\
But now there is a horizontal split between the two panes.\
To switch between horizontal and vertical split do `prefix + space`.

#### resizing panes

The command above did not always work.\
What you can do is `prefix + :` \
Then you are in a command prompt, then type \
`resize-pane -R 10` - to expand the current pane 10 pixels (or whatever unit) to the right

TODO: try to set key bindings for resizing the panes
