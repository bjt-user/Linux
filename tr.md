replace commas in a file with newlines:
```
cat python.dict | tr ',' '\n'
```

#### remove all whitespace from a file

```
tr -d "[:space:]" < input_file > output_file
```

Input and output file cant be the same file though...
