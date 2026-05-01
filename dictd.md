## general

Tool that can access dictionairy databases.

https://wiki.archlinux.org/title/Dictd

#### dict protocol

https://en.wikipedia.org/wiki/DICT

#### installation

```
sudo pacman -S dictd
```

## usage

#### basic usage

```
$ dict "hermeneutics"
2 definitions found

From The Collaborative International Dictionary of English v.0.48 [gcide]:

  Hermeneutics \Her`me*neu"tics\, n. [Gr. ? (sc. ?).]
     The science of interpretation and explanation; exegesis;
     esp., that branch of theology which defines the laws whereby
     the meaning of the Scriptures is to be ascertained.
     --Schaff-Herzog Encyc.
     [1913 Webster]

From WordNet (r) 3.0 (2006) [wn]:

  hermeneutics
      n 1: the branch of theology that deals with principles of
           exegesis
```

#### use specific dict server

```
$ dict -h dict.org "right triangle"
1 definition found

From WordNet (r) 3.0 (2006) [wn]:

  right triangle
      n 1: a triangle with one right angle [syn: {right triangle},
           {right-angled triangle}] [ant: {oblique triangle}]
```

#### show databases

```
dict -I
```

#### translate german to english

```
$ dict -d fd-deu-eng "Wurst"
1 definition found

From German-English FreeDict Dictionary ver. 0.3.5 [fd-deu-eng]:

  Wurst /vurst/ <n, s>
  sausage
```

#### translate english to german

```
$ dict -d fd-eng-deu "triangle"
1 definition found

From English-German FreeDict Dictionary ver. 0.3.7 [fd-eng-deu]:

  triangle /traiæŋgl/
  Dreieck <n>, Dreieck  [math.] <n>
```
