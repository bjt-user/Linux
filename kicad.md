## general workflow

1. Make a schematic in Schematic Layout Editor and annotate symbols
1. Perform Electronic Rule Check & Assign Footprints to the schematic symbols
1. Go into PCB Layout Editor and load the Schematic
1. Routing
1. Make automatic check that everything is connected and view PCB layout in 3d view
1. Export Gerber Files

***
## Schematic Layout Editor

Activating "change cursor shape" at the left hand side helps to place parts on the same x/y-position.

A: place and select symbol/part at cursor position
E: show properties of the symbol at cursor position (no left click needed)
(this is needed to set part value and reference)
M: move part at cursor position (no left click needed)
G: drag part at cursor position (no left click needed) (part stays in connection with the circuit)
C: copy part at cursor position (no left click needed)
R: rotate part
W: place wire at cursor position (to end the wire do a left-click)
DEL/ENTF: delete part at cursor position (no left click needed)
(or you can select multiple parts by using the "select item" tool (mouse symbol)
and dragging a rectangle around them)
ESC: end the current mode


Zooming:
F1: Zoom into cursor position (stronger zoom than mouse wheel)
F2: Zoom out
Pos 1: Go back to standard view

For electrical connections it is important that there are "junction points" between wires
that have been placed separately. Sometimes these are created automatically, sometimes not.
You can place them manually by clicking the symbol on the right hand side.

When the schematic is done, go to tools->annotate schematic!
(this adds numbers to the parts, R1, R2,...)
(places numbers where the "?" in the reference of the part was)

After adding annotations click the "perform electrical rules check" button on the upper side of the screen.
Click on "run".
=> I get the warning: pin conntected to other pins but not driven by any pin
(this happened to GND-connections)
(you can probably ignore this warning, but to get rid of it:
Add another GND-symbol and place it outside of the circuit.
Add a PWR_FLAG-symbol and connect it to the GND-symbol.
Those two symbols are only connected to eachother and nowhere else.
=> Now ERC is happy.
If you also have unconnected positive voltages you have to do it similarly.
(You can also connect the PWR_FLAG symbol directly to a GND symbol that is inside the circuit,
but you have to put it very close to the GND symbol so that it is directly tied to it.)

Now click on "assign PCB footprints to schematic symbols" on the upper side of the screen.
On the left hand side you have the footprint library i.e. "Battery".
On the right side you have the footprints.
You can filter the footprints by name if you enable the button in front of the search field.
You can copy and paste footprints to other symbols with ctrl + c and ctrl + v.
You can view the footprint by clicking on the corresponding button on the upper left side.
(there is also a 3d viewer or measure distances with a tool)
After everything is assign click apply and save and ok.

***
## PCB Layout Editor

### layers

On the right hand side you see a lot of different layers.\
To see what each layer is hover with the mouse over the layer.\
(dwgs.user = explanatory drawing from the user, those will probably not be in the gerber file
and not be printed on the pcb)\
(adhesive layers are if parts are glued onto the board probably never relevant for hobbyists)\
(paste layers are also probably not relevant for most hobby users
is only relevant if you want an assembled board or stencil)\
The checkboxes in front of the layer enable/disable visibility of the layer.\
The arrow in front of the layer signals which layer you are working on right now.

**F.SilkS** is the silkscreen.\
With the silkscreen part names like U1 R1 D1 / text and so on, and outlines of the parts will be drawn.

**f.fab** is the fabrication layer - it will **NOT** be part of the pcb.\
You need f.fab only if you let the pcb manufacturer do the assembly of the parts.\
If you solder the parts on the pcb yourself, you do NOT need it.

***
Though the hotkeys are the same as in Schematic Layout Editor you have to leftclick to select a part
before you can rotate, move, ect...

First select the `Edge.Cuts` layer and use the `add graphic polygon` tool to set the dimensions of your pcb.\
The have to connect the last end of the polygon to the beginning of the first line.\
Check with <kbd>alt + 3</kbd> to see if it worked.

Then if you want to have a **ground layer** on the back:\
Select layer `B.Cu` and select the `add filled zones` tool.\
Click on the left upper corner of your pcb dimensions.\
Then you have to select the pad you want to have on that layer.\
In my case it was `Net-(BT1-Pad2)`.\
Hit ok. Then click the upper right corner of your pcb dimensions.\
Then the lower right corner, the lower left corner, and again the upper left corner.\
Then check with <kbd>alt + 3</kbd> if it worked.\
If the ground plane worked the ground pins have a dashed circle around them (in the 3d view).\
I think it is good to make the "filled zone" of the ground layer way bigger than your edge.cuts, because then it will be easier to select the edge.cuts later, because you probably need to change the edge.cuts again.

When you have to change the filled zone, you should hit <kbd>b</kbd> afterwards so that it applies the filled zone again.

When you have to **change** the `edge.cuts` **afterwards** you need to click on it with the left mouse button and then hit <kbd>e</kbd>.\
And this probably only work, if the `filled zone` is not exactly on that line...

How to straighten lines in PCB layout editor?

Zoom in to the line. Left click to select, then right click -> properties and set the X or Y coordinates to the same point.
Or press E instead of the right click.

Alt + 3  -> opens 3d viewer

How to delete unwanted text on the pcb?
Moving the cursor on the text and hitting the DEL key does not work.
=> hover over the text and hit E. Then uncheck "visibility".

Last step in PCB layout editor "perform design rules checks" (bug symbol).

***
## How to edit footprints

In PCB Layout Editor hover over the footprint with your mouse and press 'E'.
Click "edit footpring". Then your footprint is shown.
Hover over the hole or pad you want to change and press 'E'.
Then you can change the hole and pad size.

You can export that custom footprint, but it is not shown in the library.
So we have to find out how to add a custom library as the standard library is read-only which is good.

***
## custom footprints

there seem to be no footprints for simple rocker switches

open `footprint editor` \
file -> new footrpint (or ctrl + n) \
then you can use for example the `add pad` button on the right hand side \
put it somewhere and edit its properties with the `e` key

you should set units to millimeter on the left hand side\
and use a grid of for example 0.5000mm or 1.0000mm at the top\
(thats the distance between the dots)

You can view how it looks with `view` -> `3d viewer` or <kbd>alt + 3</kbd>

then you have to save it to a footprint library \
you should create a custom footprint library

here you can manage the path of the footprint libraries:\
`preferences` -> `manage footprint libraries`

Usually you need at least one `pad` to connect your part to other parts.\
Those pads need `pad numbers` through which they will be connected.\
Those `pad numbers` have to fit to the schematic symbols.

If you want to add **mounting holes** to your footprint:\
click `add pad`, hover over the pad, hit <kbd>e</kbd> \
select `pad type: npth, mechanical` (npth means `no pad through hole`)\
and hit ok

***
## custom symbols

open `symbol editor`

`file` -> `new symbol`

then you have to create a symbol library and add that symbol to it

then you can use the buttons on the right hand side to create a symbol

to draw lines you have to select `add lines and polygons to the symbol body`,\
then click somewhere, draw the line, and complete the line by a double left mouse click

you can form coils and transformer windings with the `add arcs arcs to symbol body` button

you can add a **footprint** to the symbol with `edit` -> `properties`\
=> after that when you add that symbol to your schematic it will automatically have that footprint in it

***
## export gerber files

open `pcb layout editor`

`perform design rules check` to make sure there are no errors

file -> plot

plot format: gerber

now select an output directory\
(make a new directory just for the gerber files for this project)

now select all the layers you need

then click `generate drill files`

in the new window the standard settings should be ok, but check them again,\
then `generate drill files` and `close`

click `plot`\
`close`

***
## upload gerber files to jlcpcb

you have to zip the gerber folder and upload that zip file

```
zip -r gerber_files_flyback.zip gerber_files_flyback
```

To get 2 layers pcbs for around 5$ you need to have 100mm x 100mm dimensions.
