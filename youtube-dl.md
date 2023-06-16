https://github.com/yt-dlp/yt-dlp

=> using the linux standalone binary works

#### installation

https://github.com/ytdl-org/youtube-dl \
=> doesnt work anymore

```
yt-dlp -f m4a https://www.youtube.com/watch?v=9a6hd41wyUc
```

Put the youtube link in quotes so that characters like `&` will not destroy the command.

#### playlists

trying to download a playlist by copying the link of the first video of the playlist:
```
youtube-dl -f mp4 --yes-playlist 'https://www.youtube.com/watch?v=ElWo5fd4rIU&list=PLYmlEoSHldN7HJapyiQ8kFLUsk_a7EjCw&index=2'

ERROR: unable to download video data: HTTP Error 403: Forbidden
```

adding the `-i` option:
```
youtube-dl -i -f mp4 --yes-playlist 'https://www.youtube.com/watch?v=ElWo5fd4rIU&list=PLYmlEoSHldN7HJapyiQ8kFLUsk_a7EjCw&index=2'
```
=> that at least leads to a progress bar
it takes very long but it downloads one video after the other

***

#### downloading audio

```
yt-dlp -f m4a https://www.youtube.com/watch?v=9a6hd41wyUc
```


`-x` for extract audio

mp3 seems to be not available

but
```
youtube-dl -x [link]
```
downloads the `.opus` format...

```
youtube-dl -x -f m4a [link]
```
seems to be the best syntax, because a lot of devices, like cars don't play `.opus` which is an open source format.\
`m4a` is a mp4 format that just contains audio.

It seems like you have to hit <kbd>enter</kbd> after this line `[ffmpeg] Post-process file Hitman - Contracts Original Soundtrack - Budapest Bath Hotel-rWjVrlGjZ2s.m4a exists, skipping`.
