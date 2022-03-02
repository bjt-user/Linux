from the `man sed`:
```
DESCRIPTION
    Sed  is a stream editor.  A stream editor is used to perform basic text
    transformations on an input stream (a file or input from  a  pipeline).
    While  in  some  ways similar to an editor which permits scripted edits
    (such as ed), sed works by making only one pass over the input(s),  and
    is consequently more efficient.  But it is sed's ability to filter text
    in a pipeline which particularly distinguishes it from other  types  of
    editors.
```


```
-i[SUFFIX], --in-place[=SUFFIX]

    edit files in place (makes backup if SUFFIX supplied)
```

---

The following command replaces the string `<tag>` with the string `<notag>` in the file `test`.
```
sed -i 's/<tag>/<notag>/' test
```

this deletes all tags in a file named `test`:
```
sed -i 's/<.*>//' test
```
