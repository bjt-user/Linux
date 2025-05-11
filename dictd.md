## general

Tool that can access dictionairy databases.

https://wiki.archlinux.org/title/Dictd

#### installation

```
sudo pacman -S dictd
```

## usage

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

#### show databases

```
dict -I
```

#### translate

```
$ dict -d fd-deu-eng "Wurst"
1 definition found

From German-English FreeDict Dictionary ver. 0.3.5 [fd-deu-eng]:

  Wurst /vurst/ <n, s>
  sausage
```
