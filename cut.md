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

`cut` seems to only work for files, not for strings or variables with strings.
