## short manuals and hints for useful programs

A **sqlite3 browser** (comfortable gui program for sqlite3 databases)
sudo apt install sqlitebrowser

=> works great, in the "browse data" area you can insert records, update records very fast, don't forget to write changes (ctrl + s)
=> databases can be opened with a shortcut (crtl + 1 for the first database), very intuitive user interface

-------------------------------------------------------------------------------------------------

**gTTS (Google Text To Speech)** (better quality than festival, female voice)
sudo pip3 install gtts

gtts-cli -f test.txt -o output.mp3

-------------------------------------------------------------------------------------------------

Text To Speech Software: (with crappy quality)
sudo apt install festival
text2wave exampletext.txt -o output.wav

- - -

**Record your screen** (wayland fails):
sudo apt install simplescreenrecorder
=> the program can be started over the "show applications" menu
"You are using a non-X11 window system (e.g. Wayland) which is currently not supported by SimpleScreenRecorder.
Several features will most likely not work properly.
In order to solve this, you should log out, choose a X11/Xorg session at the login screen, and then log back in."
=> does not work on Debian, but DOES work on Ubuntu

You could probably just use OBS instead.
sudo apt install obs-studio
After this operation, 18.5 MB of additional disk space will be used.
(was a fast installation)
You have to add a source before recording.
You can choose "window capture" and then add the window you want to record.
=> does not seem to work for recording Linux Terminals

**Just switch to "Default X11" in the login menu instead of wayland and SSR works.**  
[see display_server.md](display_server.md)

---

Watch videos:
sudo apt install vlc

***

openshot:
todo: report bug: crash when clicking on preferences
