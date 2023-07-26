You can boot up your pc at a specific time.\

Put the RTC alarm option in your BIOS to `handled by OS`.

Put this script in `/usr/local/sbin/shutwake.sh
```
#!/bin/bash 
sh -c "echo 0 > /sys/class/rtc/rtc0/wakealarm" 
sh -c "echo `date '+%s' -d 'tomorrow 18:00:00'` > /sys/class/rtc/rtc0/wakealarm" 
shutdown now
```

or
```
#!/bin/bash 
sh -c "echo 0 > /sys/class/rtc/rtc0/wakealarm" 
sh -c "echo `date '+%s' -d '+ 420 minutes'` > /sys/class/rtc/rtc0/wakealarm" 
shutdown now
```

make a crontab at the time you want to shut down your pc:
```
# crontab -e 
# m h  dom mon dow   command 
00 22 * * 1-5 /usr/local/sbin/shutwake
```
