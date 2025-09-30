## examples

#### simple sleep

```
vim9script

def MyFunc(my_channel: channel)
        echo "hello from MyFunc"
enddef

var sleep_job = job_start(['sleep', '3'], {'close_cb': 'MyFunc'})
```
After 3 seconds this outputs:
```
hello from MyFunc
```
