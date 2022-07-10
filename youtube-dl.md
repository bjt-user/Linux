**Old packages on Debian or Ubuntu might not work.**

#### installation

https://github.com/ytdl-org/youtube-dl



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
