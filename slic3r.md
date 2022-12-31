## Install:
```
sudo apt install slic3r
```

***
How to create a .gcode file from a .stl file:

```
slic3r --output speakerbox2.gcode speaker_box_p1_v2.stl
```

=> but the standard settings have a default of 3mm filament diameter

"--filament-diameter Diameter in mm of your raw filament (default: 3)"
=> I have 1.75mm

"slic3r --help" gives explanations about options


I was not able to start the GUI of the program.

--wipe
Wipe the nozzle while doing a retraction (default: no)
=> This option helped me to get a better first layer and less strining in holes.

-----------------------------------------------------------------------------------------------------------------
## BUGS: (version 1.3.0)
`--bed-temperature 60`  |  to enable the heated bed and heat it to 60 degree celsius, default = no bed heating
=> did NOT work, it shows 60 bed temperature in the gcode as a comment, but the printer does not heat the bed
The gcode for heating up the bed to 60 degrees would be "M140 S60" or "M190 S60" if the printer should heat it up to 60 and wait
until the temperature is at 60.

1.3.0 is the newest version.
Latest stable version is 1.2.9.
A downgrade should be considered.