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

`sed` works line by line by default.\
If you want to apply regex logic across multiple lines you have to use more complicated syntax.

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
#### replace a string everywhere in a file
```
sed -i 's/foo/bar/' replace_lines.txt
```
#### replace only at a specific line

With this command the string `foo` will be replaced by the string `bar`, but only in line 2 of the file `replace_lines.txt`.
```
sed -i '2s/foo/bar/' replace_lines.txt
```

In a bash script with variables you have to use it like this:
```
sed -i "${line_number}s/${section_number}/${section_counter}/" ${LIST_PATH}
```
Use double quotes around the command part of sed and curly brackets to enclose variables.\
With single quotes I got an error.

#### inserting a line at a specific line
Inserting the line `This is the new line` at line 2 of file `replace_lines.txt`:
```
sed -i '2i\This is the new line\' replace_lines.txt
```
The line that was previously in line 2 is now in line 3.\
And all the lines after that have shifted one line down.

It also works with a different syntax:
```
sed -i "2i a line" insert_lines.txt
```

In a bash script inside a for loop with an array I had to do it like this:
```
sed -i "${insert_position}i\\${line}\\" ${LIST_PATH}
```
(where line was the element in a foreach style for loop)

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

***

#### replace all tabs with two spaces

```
sed -i 's/\t/  /g' MyMainClass.java
```

***
#### print from a specific line to the end

print everything from line 5 to the end of the file:
```
sed -n '5,$p' myfile.txt
```

print only line 5:
```
sed -n '5p' myfile.txt
```

print line 5,6, and 7:
```
sed -n '5,7p' myfile.txt
```

#### delete from string occurence to string occurence

This will delete everything from the line that contains `section 3`\
to the line that contains `section 4`, and also deletes those two lines:
```
sed '/section 3/,/section 4/d' shoppinglist.txt > new_file.txt
```

#### change Windows line endings to Linux line endings

```
sed -i -e 's/\r$//' myscript.sh
```

***

#### remove all blank lines from a file

```
sed '/^$/D' shfmt_test.sh
```
