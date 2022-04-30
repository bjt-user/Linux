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
#### delete lines of a file
this deletes the 2nd line of the file `shoppinglist.txt`
```
sed --in-place '2d' shoppinglist.txt
```
this deletes the lines 4 to 8:
```
sed --in-place '4,8d' shoppinglist.txt
```
to use that in a `bash` script with variables:
```
sed --in-place "${delete_from},${delete_to}d" ${FILE_PATH}
```
***

#### working with tags and html
The following command replaces the string `<tag>` with the string `<notag>` in the file `test`.
```
sed -i 's/<tag>/<notag>/' test
```
***
this deletes all single line tags in a file named `test`:
```
sed -i 's/<.*>//' test
```
It does not work if a tag stretches over multiple lines though.
