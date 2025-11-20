## examples

#### D - delete file after function ends

This will create a temporary file that only exists until the end of the function:
```
vim9script

def WriteTempFile()
        var myfile = tempname()

        echo myfile

        writefile(["foobar"], myfile, 'D')

        var file_content = readfile(myfile)

        echo file_content
enddef

call WriteTempFile()
```

The file contains the string `foobar`.

This can be useful for tests because the temporary file is deleted automatically.
