## general info

Events dont seem to be saved in an iCalendar file by default,\
but you can import and export iCalendar files.

Events are in a simpler format in `${HOME}/.local/share/calcurse/apts` and \
`${HOME}/.local/share/calcurse/notes` (this file contains uuids that connect to entries in apts).

## installation

```
sudo pacman -S calcurse
```

## configuration

`~/.config/calcurse/conf`

#### date format

```
format.inputdate=4
```

```
format.outputdate=%Y-%m-%d
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

#### insert multi day event

Navigate to the start day.\
Hit `a`.

Now enter `00:00`.\
In the next field enter
```
+7d
```
for an event that lasts 7 days.

Now enter the description.

#### add or edit notes

To add more information to an appointment hit `n` in \
when in "appointments" window.

#### show events in the next 14 days

Without entering the ncurses menu:
```
calcurse -r14
```
