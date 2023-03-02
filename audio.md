`pulseaudio` and `pipewire` are audio servers.

## how to figure out if you are using pulseaudio or pipewire?

```
$ ps -ef | grep -i "pipe"
bf          2079    1856  0 19:09 ?        00:00:10 /usr/bin/pipewire
bf          2082    1856  0 19:09 ?        00:00:13 /usr/bin/pipewire-pulse
```

pipewire doesnt seem to have a systemd unit

But there seems to a compatibility layer involved since `pulseaudio volume control` (or pavucontrol) does change my audio output volume.

***

## pipewire

https://docs.pipewire.org/

`/usr/share/pipewire/pipewire.conf`

The program `qpwgraph` is supposed to be a gui help for pipewire.\
Seems very chaotic though.

#### pipewire - record audio

If you use `pipewire` you can test your input device by recording like this:
```
pw-cat -r recordme
```



***
## pulseaudio
```
pactl info
```

***
Puts the sound of a .mp4 Video into a .mp3 file:

ffmpeg -i input.mp4 output.mp3

Converting to .webm works the same way:

ffmpeg -i input.mp4 output.webm

Reducing the resolution of a video:

ffmpeg -i <input> -vf scale=480x360,setdar=4:3 <output>


***

## Volume problem in movies

In movies the volume is always unappropriate, shootings and music is very loud,
quiet conversations you want to hear are unhearable silent.
In my experience while using headphones this problem is less dominant but still exists.

----------------------------------------------------------------------------------------

Using OpenShot:
Imported movie, separate audio command took forever so I quit.

Tried it another time. Waited 2 minutes switched to browser in the meantime.
Then it worked.
But how do I just cut the audio without cutting the video clip too?
=> don't use short cut, use the mouse, left click to select the clip,
right click on the clip -> slice -> keep both sides
Then select the clip, right click and put the volume to 10% or delete the audio clip.

=> this works ok, but the performance is a little slow, maybe reduce the quality of the video
before doing this!

Exporting was a problem at 720p 30fps medium quality.
Took 1 hour and the file is now 4.3GB big which is way too much.
The problem was the original file was 720X320 at 24 fps and the new file is 720x1980 at 30fps.
So I chose the wrong export option.

Rendering/exporting video has to be done in advanced mode.
You need to view the video and audio settings of the original video in file browser (video bitrate,
audio bitrate, sample rate, codec, dimensions).
The file size of the exported video is ok now, but I still have problems with the resolution.
The video is squished together and the black frames on bottom and top are bigger than orignal
even though I selected the same resolution.
Außerdem Audiotrack verschoben...

----------------------------------------------------------------------------------------

VLC Media Player:

Tools -> Effects and Filters (ctrl + E)

=> try experimenting with enabling equalizer and/or enabling compressor
==> doesn't really seem to help, maybe you have to change some settings
===> changed settings, doesn't help

----------------------------------------------------------------------------------------

Try that didn't get me anywhere:

sudo apt install pulseaudio-equalizer

command to start the program:
qpaeq

Error
solution: https://linuxhint.com/install-pulseaudio-equalizer-linux-mint/

sudo vim /etc/pulse/default.pa

Add the below-given lines at the bottom of the/etc/pulse/default.pa file.
load-module module-equalizer-sink
load-module module-dbus-protocol

Next, kill the PulseAudio service and restart it:
$ pulseaudio --kill && pulseaudio --start

Now, open the PulseAudio with the command:
$ qpaeq

=> Ok, jetzt funktioniert zwar das Programm, aber ich kann mit dem Programm nichts anfangen.
Scheint auch keine Dateien zu manipulieren sondern nur generell den Output.

***

#### audacity

```
sudo apt install audacity
```

Cut out audio: Select a range with the mouse and hit <kbd>del</kbd>

Keep everything but the selected: select a range with the mouse and go to `edit -> remove special -> trim audio`. (or <kbd>ctrl</kbd> + <kbd>t</kbd>\
Then put it on the beginning of the track with `tracks -> align tracks -> start to zero`


#### no sound issue

I had the issue that no sound was working on Ubuntu anymore because of various system problems.

Then I did

```
sudo apt reinstall alsa-base
```
```
sudo apt reinstall pulseaudio
```
```
reboot
```
And sound was working again.


## troubleshooting

### no audio input from headset

I had no audio input from my headset.

The solution was to go into `pulse audio volume control` or `pavucontrol`.\
"Input devices" -> And set your headset as `fallback`

With `pipewire` you can test it with `pw-cat -r myfile`, go into `nnn` and hit enter on the file.

***
