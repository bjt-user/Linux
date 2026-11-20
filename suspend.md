#### lock screen and suspend

This script will use `i3lock` to lock the screen.\
And also go into suspend.
```
#!/bin/bash

# pause notifications
dunstctl set-paused true

# loginctl lock-session
i3lock -c 272d2d

# acpi sleep state 3
sudo systemctl suspend

# restore notifications
dunstctl set-paused false

exit 0
```
