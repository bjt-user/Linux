## general info

Events dont seem to be saved in an iCalendar file by default,\
but you can import and export iCalendar files.

Events are in a simpler format in `${HOME}/.local/share/calcurse/apts`

## installation

```
sudo pacman -S calcurse
```

## usage

#### import icalendar file

```
calcurse -i calendar.ics
```

(does this work for single appointments as well \
invitations that were sent via email?)

If you import a file twice you will have every event in that file \
twice in `calcurse`.

#### export icalendar file

```
calcurse -x > test.ics
```

When importing and then exporting ical, the information \
`ORGANIZER` and `ATTENDEE` seem to get lost.

#### change windows

TAB to select another window!

For example to switch to "appointments" from "calendar".

#### insert appointment

(In "calendar" window)

navigate to the day you want to insert your appointment

ctrl + A

1200 or 12:00 for the start time \
similar for the end time

(In "appointsments" view)

Just hit `a`
