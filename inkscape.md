## basic information

#### installation

```
sudo dnf install inkscape
```

version 1.2.1

inkscape creates vector graphics opposed to pixel graphics.

#### getting started

good tutorial:\
https://www.youtube.com/watch?v=8f011wdiW7g&list=PLqazFFzUAPc5lOQwDoZ4Dw2YSXtO7lWNv&index=2

#### terminology

**objects vs. path**:\
With the `bezier tool` you can draw lines. By using the `bezier tool` you create a "path" but NOT an object.\
With the `rectangle tool` or the `circle tool` you create "objects".

You can select an "object" and click path->object to path and then you can double click the object (that is now a path).\
And then you can change/move the "points"/corners of that path and change the shape of that object.

## usage

#### view

<kbd>ctrl</kbd> + <kbd>4</kbd> - center page

#### how to draw a line

lines keep disappearing

hit <kbd>b</kbd> \
left click on one spot then left click another spot\
then hit <kbd>enter</kbd>\
then the line is not visible\
hold <kbd>shift</kbd> and click on the black button at the bottom left (that changes the stroke color)\
=> now you have a black line that is not invisible

or <kbd>ctrl + shift + f</kbd> and select stroke and fill

But how to I make that line **straight**?\
hit <kbd>b</kbd> leftclick on the screen\
and then hold <kbd>ctrl</kbd> while drawing the line to make it straight

#### moving objects

you can select them with the select tool (<kbd>s</kbd>)

then you can move the objects with arrow keys\
(but it is an uneven number of millimeters)\
can you set the ammount of millimeters that a stroke with an arrowkey will move the object?\
preferences -> behaviour -> steps

#### grid

with <kbd>#</kbd> you can switch the grid on and off (or view->page grid)

interface->grids

you can for example switch to `mm` and select the `rectangular grid` pane\
set spacing x to 2.540 and spacing y to 2.540.\
=> then 2 squares seem to be 2.54mm on each side

But that does not work as I would expect it...the grid size stays the same as you zoom in and out...

#### layers / levels / overlapping problem

If you just want to have **one object above the other** you do **not** necessarily have to make a new layer.\
There are four buttons at the top of the screen.\
`lower selection to bottom` (<kbd>end</kbd>)\
`lower selection one step` (<kbd>page down</kbd>)\
`raise selection one step` (<kbd>page up</kbd>)\
`raise selection to top` (<kbd>home</kbd>) (seems to be <kbd>pos1</kbd> on german keyboards)

You can hit <kbd>tab</kbd> to cycle through all objects beginning from the lowest object\
and then going higher in "levels".

If you have an object that is hidden behind another object, you can hold <kbd>alt</kbd> and click several times.\
Then it should cycle through all objects that are behind the upper object.

If you want to mess with layers:\
<kbd>ctrl + shift + l</kbd> (or click on the layer button at the left bottom)

to move an object to a layer:\
select the object, right click -> move to layer\
or drag and drop in the layer view


#### document properties

file -> document properties

Here you can set how big the page is.

You can `resize page to content` (<kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>r</kbd>)

#### fill

If you select a rectangle and click a color on the bottom you change the `fill color`.

**No fill**: If you go to the `fill and stroke menu` with <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>f</kbd> and select the `fill` pane\
you can click on the X-symbol (`no paint`) to not use any fill at all.

#### stroke

If you select a rectangle object and hold <kbd>shift</kbd> and then click on a color on the bottom you change the `stroke color`.

**No stroke**: If you go to the `fill and stroke menu` with <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>f</kbd> and select the `stroke` pane\
you can click on the X-symbol (`no paint`) to not use any stroke at all.

#### text box

Hit <kbd>t</kbd> or click on the "text tool" symbol on the left panel.

Draw a rectange with the left mouse button.\
Insert your text.\
Then hit <kbd>Enter</kbd> (maybe twice) to leave the "text tool".

Adjust font size:\
Right click -> "text and font"

#### unicode in text boxes

<kbd>ctrl</kbd> + <kbd>u</kbd>\
<kbd>2716</kbd>\
<kbd>enter</kbd>

#### snapping

In the upper right corner there is a button called "snapping".

Click it to activate snapping objects to the grid.

#### center object

Select your object with left mouse.

Object -> Align and Distribute (or ctrl + shift + a) \
Under "Align" you can center your object in different ways.

#### export to png

file -> export png image

you can select what you want to export in the pane\
page will export the whole page, white background is transparent\
drawing will just export the drawing and not the whole page, background is transparent\
if you select an object with the selection tool and use the `selection` pane, just that object will be exported\
the `custom` pane lets you set coordinates which should be exported


***
## advanced features

#### groups

select an object, hold <kbd>shift</kbd>, then select another object\
hit <kbd>ctrl</kbd> + <kbd>g</kbd> (or object->group) to group those objects together.

to ungroup those objects again you can select the group and hit <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>g</kbd>

When you have a group all actions you do will be performed on all objects in that group.

#### rounding corners

Double click an object (for example a rectangle) and then move the round dot at the upper right corner of the object to round the edges.

