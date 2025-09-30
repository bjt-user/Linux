## example

#### calling func that doesnt exist

```
vim9script

try
        call Unknown()
catch
        echo "Calling the func Unknown() failed."
endtry
```
outputs:
```
Calling the func Unknown() failed.
```
