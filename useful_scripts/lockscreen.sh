#!/bin/bash

# use this to enable the lockscreen in i3 when using dunst
# this way notifications received while lock screen is enabled
# are not lost, they will be shown after the screen is unlocked again

# pause notifications
dunstctl set-paused true

#loginctl lock-session
i3lock --nofork -c 272d2d

# restore notifications
dunstctl set-paused false

exit 0
