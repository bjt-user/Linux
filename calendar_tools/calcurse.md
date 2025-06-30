## general info

Events dont seem to be saved in an iCalendar file by default,\
but you can import and export iCalendar files.

Events are in a simpler format in `${HOME}/.local/share/calcurse/apts`

## usage

#### import icalendar file

```
calcurse -i calendar.ics
```

(does this work for single appointments as well \
invitations that were sent via email?)

#### export icalendar file

```
calcurse -x > test.ics
```

#### insert appointment

navigate to the day you want to insert your appointment

ctrl + A

1200 or 12:00 for the start time \
similar for the end time
