To cut a string, separate it by `<tabs>`, and use only the first part:
```
cut -f1
```

The default separator is a tab.\
But you can use any separator like this:
```
cut -d':' -f2 /etc/passwd | tail -n 5
```

---

#### cut on variables

`cut` expects to read from a file or stdin, but with `<<<` you can also pass a variable to it.
```
foldername=$(cut -d'/' -f5 <<<$repo)
```
