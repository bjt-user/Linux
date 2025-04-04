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

## delete lines of a file

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

#### delete lines that match a specific regex

```
sed -i '/^my_search_string.*/d' *.yaml
```

#### delete all lines until a specific line by regex

(This is great for shrinking huge log files.)

Delete from the first line to the first line that is exactly `is`:
```
sed '0,/^is$/d' foobar.txt
```

```
What in
the
hell
is really
is
up
with
sed?
```
=>
```
up
with
sed?
```

#### replace a string everywhere in a file
```
sed -i 's/foo/bar/' replace_lines.txt
```

#### replace a string that contains spaces

That worked:
```
sed 's/installed shellcheck/test/' pacman.log
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

#### replace a string in all *.go files in the current dir

```
sed -i "s/before/after/g" *.go
```

#### replace recursively in multiple files

This will only replace one string per line:
```
find . -type f -iname "*.yaml" -exec sed -i 's/replace_me/new_string/' {} \;
```

You probably need `g` flag after the last slash.

#### inserting a line after a matched line

This will insert the line `proxy=http://foo:8888` after the line `[main]`:
```
sed '/[main]/a proxy=http://foo:8888' /etc/dnf/dnf.conf
```

(to actually insert you will need `-i` and `sudo`)

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

#### delete lines from multiple files

Delete all lines that start with `VIRTUALIZATION_PLATFORM` from yaml files:
```
sed -i '/^VIRTUALIZATION_PLATFORM/D' *.yaml
```

#### search for a string in a file (grep equivalent)

```
sed -n '/shellcheck/p' pacman.log
[2023-12-04T08:09:33+0100] [PACMAN] Running 'pacman -S shellcheck'
[2023-12-04T08:09:47+0100] [ALPM] installed shellcheck (0.9.0-68)
```
