You can compare files with the `diff` command.

#### But What Does The Output Mean Exactly?

`<` - denotes lines in file1.txt

`>` - denotes lines in file2.txt


#### Ignore The Order Of The lines

Sometimes you just change the order of lines, for example change the order of functions,\
but don't actually change the contents of the functions.\
You can check if everything is still the same except the order with this command:
```
diff <(sort sortme1.txt) <(sort sortme2.txt)
```
