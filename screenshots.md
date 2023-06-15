#### gnome-screenshot

To select an area from the screen with the mouse and make a screenshot:
```
gnome-screenshot -a
```
Then a crosshair on the mouse appears and you can select the area.

#### shotgun

This will create an image with a width of 600 pixels, and a height of 200 and start from the left upper corner of the screen.
```
shotgun -g 600x200+0+0
```

you can look at the image with this minimal image viewer:
```
feh 1686849738.png
```

20 pixels offset in y direction (cut off the top of the screenshot like the windows title):
```
shotgun -g 600x200+0+20
```

