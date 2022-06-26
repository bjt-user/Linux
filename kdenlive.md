```
sudo apt install kdenlive
```

#### add video to project
Project -> Add clip or folder

Then it appears in the left box and from there you can move it in the bottom in the working area.

#### working area and project bin
There are two areas (the working area and project bin).\
And two video boxes. One box shows the video of the clip that is in the `project bin`.\
The video on the right shows the video in the working area.\
You can play it with the play button or just hit <kbd>space</kbd>.

#### scroll bar

The scroll bar for the timeline of the working area is hidden and will only be visible if you move the mouse towards it.\
It is below the area for the video and audio clips.

#### cut pieces out of a video

select the `razor tool` or hit <kbd>x</kbd>

then you can left click on the spot where you want to split the video in the bottom working area.\
when you are done you can switch back to the `selection tool` or hit <kbd>s</kbd>.

then you can do this again for the end of the part you want to cut out.\
switch to `selection tool` and left click the part you want to remove and hit <kbd>del</kbd>.

#### fade in/out

move the mouse to the upper right corner of a clip until a small red circle appears.\
drag that circle into the clip depending on how long the fade should last.

#### keyboard shortcuts

ctrl + pos1 - go to beginning of the timeline \
ctrl + enter - render project

#### enable proxy clips

enable proxy clips if you dont have powerful hardware.\
this means that you work with videos in reduced quality for previewing and stuff but the result will be rendered in the actual desired quality.

https://kdenlive.org/en/project/kdenlive-proxy-clips/

#### reduce volume of a clip

effects->audio corrections->volume (keyframeable) and drag that into the clip

then leftclick the clip and you can adjust the `gain` (set it to -30 to have a big effect)

#### rendering

I havent found an option for no reencoding yet.

You can tick the `more options` box and then select how much threads you want to use.
