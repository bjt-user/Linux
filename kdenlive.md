#### installation

```
sudo apt install kdenlive
```

#### add video to project
Project -> Add clip or folder\
(you can right click on it to setup a custom keyboard shortcut)

Then it appears in the left box and from there you can move it in the bottom in the working area.

#### working area and project bin
There are two areas (the working area and project bin).\
And two video boxes. One box shows the video of the clip that is in the `project bin`.\
The video on the right shows the video in the working area.\
You can play it with the play button or just hit <kbd>space</kbd>.

#### scroll bar

The scroll bar for the timeline of the working area is hidden and will only be visible if you move the mouse towards it.\
It is below the area for the video and audio clips.

You can also scroll horizontally by clicking and holding the mid mouse button and moving the mouse.

#### cut pieces out of a video

select the `razor tool` or hit <kbd>x</kbd>

then you can left click on the spot where you want to split the video in the bottom working area.\
when you are done you can switch back to the `selection tool` or hit <kbd>s</kbd>.

then you can do this again for the end of the part you want to cut out.\
switch to `selection tool` and left click the part you want to remove and hit <kbd>del</kbd>.

Another way is to set the "selection line" to the right time, then select the clip you want to cut.\
And then hit <kbd>shift + r</kbd>.

#### select multiple clips in the working area

Hold <kbd>shift</kbd> and the left mouse button and drag to select multiple clips.

***

#### fade in/out

move the mouse to the upper right corner of a clip until a small red circle appears.\
drag that circle into the clip depending on how long the fade should last.

#### keyboard shortcuts

ctrl + pos1 - go to beginning of the timeline \
ctrl + enter - render project\
shift + drag a rectangle with left mouse - to select multiple clips

You can rightclick on menu items to create custom shortcuts.

#### enable proxy clips

enable proxy clips if you dont have powerful hardware.\
this means that you work with videos in reduced quality for previewing and stuff but the result will be rendered in the actual desired quality.

https://kdenlive.org/en/project/kdenlive-proxy-clips/

#### reduce volume of a clip

effects->audio corrections->volume (keyframeable) and drag that into the clip

then leftclick the clip and you can adjust the `gain` (set it to -30 to have a big effect)

or (simpler):\
effects->volume and dynamics->gain (drag it onto the audio clip)\
Then simply use a 10% gain on that clip and it will be very quiet.

***
#### transitions

Add a transition of two video clips.\
Put one video clip over the other one.\
Then click on the small dot on the upper video clip and there will be a "wipe" transition added".

With audio it does not work like that, it will just fade in and out for some time if you click this dot at the corner of the audio clips.

***
#### rendering

I havent found an option for no reencoding yet.\
It's probably not possible if you edit it.

You can tick the `more options` box and then select how much threads you want to use.

A 90min video rendered to the .webm standard profile with 2 threads took 30 minutes.\
Quality is ok.
