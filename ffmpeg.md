Extract the first 20 seconds of a video and save it in a second file.
```
ffmpeg -t 20 -i inputfile.mp4 outputfile.mp4
```
=> duration: 2 seconds

cut out first 30 seconds without reencoding:
```
time(ffmpeg -ss 00:00:30 -i input.mp4 -c copy output.mp4)
```
duration: 11s

You can combine these two to cut out parts of a video:
```
time(ffmpeg -ss 00:00:57 -t 4 -i random_video.mkv aliases.mp4)
```
duration: 2s

(start the video at 00:00:57 and then take 4 seconds, so it extracts from 00:00:57 to 00:01:01)\
Even with converting formats and reencoding if you just cut out small parts this is very fast.

But can you cut out a part of the video in the middle and put it all back together?\
https://gist.github.com/donis/85f4f96d16549fa43d02 \
so you have to take the first part until the scene you dont want, take the second part, and then concatenate them back together.\
maybe you can write a script that does that more conveniently.

I wrote a script that works, but with a big quality loss even without reencoding...\
there is one warning: `track 1: codec frame size is not set`

***
Fails where reencoding occured:

Cut out the first 30 seconds of a 1.5 hour video and saved the rest of the video in a second file:
```
ffmpeg -ss 00:00:30 -i inputfile.mp4 outputfile.mp4
```
=> duration: 25 minutes, quality seems to be unchanged

Maybe it takes so long because it is giving the video a new encoding.\
Try this command:
```
ffmpeg -ss 00:00:30 -i inputfile.mp4 -acodec copy outputfile.mp4
```
=> nope that still takes very long (because of wrong option)

#### cut audio file precisely

This will cut from second 55.5 to second 56.8 of an audio file without reencoding:
```
ffmpeg -i output.wav -ss 55.5 -to 56.8 -c copy ingenieur3.wav
```

#### record audio that is being played (to pulseaudio)

Get the index of the audio device that the audio is currently being played to:
```
pacmd list-sources | grep -e 'index:' -e device.string -e 'name:'
```

If the output device is your headphones, and headphones are index 5 do this:
```
ffmpeg -f pulse -i 5 output.wav
```

***

#### record screen and audio from microphone

```
ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i pulse -acodec aac -strict experimental output.flv
```
**WARNING: this also recorded the internal laptop microphone!**

***

#### TODO: volume stuff

```
ffmpeg -i test.webm -af  "volume=10dB"  -c:v libvpx-vp9 -crf 30   -b:v output.webm
```

https://ffmpeg.org/ffmpeg-filters.html#toc-ebur128-1

https://de.wikipedia.org/wiki/EBU-Empfehlung_R_128
