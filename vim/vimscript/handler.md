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

#### call script that sleeps and echoes

The script that is called here sleeps for 3 seconds \
and then outputs "Sleeping is over".
```
vim9script

def MyFunc(my_channel: channel)
        echo "hello from MyFunc"
        sleep 1
        echo ch_read(my_channel)
enddef

var sleep_job = job_start(['./sleep_and_echo.sh'], {'close_cb': 'MyFunc'})
```
outputs:
```
hello from Myfunc
Sleeping is over.
```

So you can get the output of the channel with `ch_read()`.

But does it also include stderr?\
=> No, if only stderr is received the error "channel is not open" \
is received.\
So you probably need to check the status of the channel/job first.
