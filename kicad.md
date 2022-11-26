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

On the right hand side you see a lot of different layers.
To see what each layer is hover with the mouse over the layer.
(dwgs.user = explanatory drawing from the user, those will probably not be in the gerber file
and not be printed on the pcb)
(adhesive layers are if parts are glued onto the board probably never relevant for hobbyists)
(paste layers are also probably not relevant for most hobby users
is only relevant if you want an assembled board or stencil)
The checkboxes in front of the layer enable/disable visibility of the layer.
The arrow in front of the layer signals which layer you are working on right now.

Though the hotkeys are the same as in Schematic Layout Editor you have to leftclick to select a part
before you can rotate, move, ect...


How to straighten lines in PCB layout editor?

Zoom in to the line. Left click to select, then right click -> properties and set the X or Y coordinates to the same point.
Or press E instead of the right click.

Alt + 3  -> opens 3d viewer
B: refill filled layers



GND-Layer
If the ground plane worked the ground pins have a dashed circle around them or rather 4 corners (in the 3d view).

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

***
## todo: custom symbols

open `symbol editor`

`file` -> `new symbol`

then you have to create a symbol library and add that symbol to it

then you can use the buttons on the right hand side to create a symbol

to draw lines you have to select `add lines and polygons to the symbol body`,\
then click somewhere, draw the line, and complete the line by a double left mouse click

you can form coils and transformer windings with the `add arcs arcs to symbol body` button
