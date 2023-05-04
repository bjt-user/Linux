#### metainformation about video files

The program `mediainfo` can be used to retrieve information about video files.\
Like `format`, `bitrate`, `frame rate`, etc.

#### converting avi to mp4

Some `.avi` files did not work in `vlc media player`.

Can I convert those videos?\
What formats are the videos even in?\
The file ending does not say much.

```
sudo apt install ffmpeg
```

```
ffmpeg -i MOVI0002.avi movie2.mp4
```
=> this seems to take some time (about 1s per 0.7s of video material)\
(and the pc fan makes a lot of noise, cpu temp goes to 90 degrees)

But it worked!

The program seems to analyze the input file and take the file ending of the supplied output file name as wanted output format.

To force the output file to have 20 frames per second:
```
ffmpeg -i MOVI0002.avi -r 20 movie2.mp4
```

Force input to 1 frame and output to 20 frames:
```
ffmpeg -r 1 -i MOVI0004.avi -r 20 movie4.mp4
```
speed was 2.5x\
but it still takes very long and laptop gets hot

**TODO: test this command:\
(from the ffmpeg docs https://ffmpeg.org/ffmpeg.html)
```
To set the video bitrate of the output file to 64 kbit/s:

ffmpeg -i input.avi -b:v 64k -bufsize 64k output.avi
```
