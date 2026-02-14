#### espeak
```
sudo apt install espeak
```

```
sudo pacman -S espeak-ng
```
(where `ng` seems to stand for "next generation")

read a text file:
```
espeak -f tts.txt
```

change the speed (default is 175):
```
espeak -f tts.txt -s 150
```

save output to a wav file:
```
espeak -f tts.txt -s 150 -w festival-output.wav
```

***

#### gTTS (Google Text To Speech) (better quality than festival, female voice)
```
sudo pip3 install gtts
```

```
gtts-cli -f test.txt -o output.mp3
```

***

#### festival

Text To Speech Software.
```
sudo apt install festival
text2wave exampletext.txt -o output.wav
```

#### TODO

https://github.com/mozilla/TTS
