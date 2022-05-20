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

***
Fails where reencoding occured:

Cut out the first 30 seconds and saved it in a second file:
```
ffmpeg -ss 00:00:30 -i inputfile.mp4 outputfile.mp4
```
=> duration: 25 minutes, quality seems to be unchanged

Maybe it takes so long because it is giving the video a new encoding.\
Try this command:
```
ffmpeg -ss 00:00:30 -i inputfile.mp4 -acodec copy outputfile.mp4
```
=> nope that still takes very long
