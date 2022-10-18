You can compare files with the `diff` command. (`diff file1 file2`)

#### But What Does The Output Mean Exactly?

Given a `diff file1 file2`, `<` means the line is missing in file2 and `>` means the line is missing in file1.

`<` - denotes lines in file1.txt

`>` - denotes lines in file2.txt

`d` stands for deletion

`a` stands for adding

`c` stands for changing

`3d2` and `5a5` denote line numbers affected and which actions were performed.\
The number on the left of the character is the line number in file1.txt.\
The number on the right is the line number in file2.txt.\
But it is not really clear what this means...\
"The 3d2 and 5a5 can be ignored, they are commands for patch which is often used with diff."


#### Ignore The Order Of The lines

Sometimes you just change the order of lines, for example change the order of functions,\
but don't actually change the contents of the functions.\
You can check if everything is still the same except the order with this command:
```
diff <(sort sortme1.txt) <(sort sortme2.txt)
```


#### different output

to make the output of `diff` look different you can use option `-u`:
```
$ diff -u comparefiles1.txt comparefiles2.txt
--- comparefiles1.txt	2022-10-18 05:09:49.785386744 +0200
+++ comparefiles2.txt	2022-10-18 05:16:12.952445168 +0200
@@ -1,10 +1,11 @@
 #!/bin/bash
 
-echo "this is different" > log.txt
+echo "this is NOT the same" > log.txt
 
-function() test {
-  echo "longer"
-  echo "longer"
+function test() {
+  echo "short func"
 }
 
+echo "this is a very very very very very long longlonglonglonglonglong line"
+
 exit 0
```
