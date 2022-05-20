Extract the first 20 seconds of a video and save it in a second file.
```
ffmpeg -t 20 -i inputfile.mp4 outputfile.mp4
```
=> duration: 2 seconds

```
ffmpeg -ss 00:00:30 -i inputfile.mp4 outputfile.mp4
```
=> duration: 20 minutes

Maybe it takes so long because it is giving the video a new encoding.\
Try this command:
```
ffmpeg -t 30 -i inputfile.mp3 -acodec copy outputfile.mp3
```
