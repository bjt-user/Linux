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
