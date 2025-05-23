# image editing in linux on the command line
------------------------------------------

```
sudo apt install imagemagick
```
(is installed automatically in Debian)

Combine two images side by side and have a fixed height for both images:
convert +append leftimage.png rightimage.png -resize x1080 output.png

To vertically append images:
convert -append ...

Resizing an image:
convert input.png -resize 1920x1080! output.png
(without the exclamation mark the tool will keep the "aspect ratio" and the output has not the exact dimensions)

To resize all images in the folder:
convert * -resize 1920x108 *
(output files will have a number at the end of the file name)

Adding text to an image:
```
convert -pointsize 20 -fill yellow -draw 'text 600,900 "This is my text"' input.png output.png
```
The 600,900 are the x,y pixel dimensions where the text starts.
Look at the resolution before adding text!
pointsize is the size of the text.




***
## image editing with GIMP

Cropping:
Select the "crop" tool in the left panel.\
Leftclick and hold in the image area.\
Drag a rectangle and stop holding the mouse button when you are done.\
Now press enter.

Drawing a line:
Select the paintbrush/pencil/... tool on the left.\
With right click on the icon you choose a particular tool.\
On the left side further down left click on the brush and select the shape of your tool.\
(for example "1. pixel")
Left click on the canvas once to make a dot. Now hold the shift key.\
Then you can select a second point which will be the end point of the line.\
You can keep on doing this to create contiguous objects.
