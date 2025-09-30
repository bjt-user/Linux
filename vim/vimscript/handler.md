## general info

```
:h close_cb
```

> If it is not known if there is a message to be read, use a try/catch block

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

#### catch output

You need a try catch as written in the docs, otherwise you will get an \
error when there is no data to read:
```
vim9script

def MyFunc(my_channel: channel)
        echo "hello from MyFunc"
        var msg = ''

        try
                msg = ch_readraw(my_channel)
        catch
                msg = 'no message'
        endtry
        echo msg
        sleep 1
enddef

var sleep_job = job_start(['./sleep_and_echo.sh'], {'close_cb': 'MyFunc'})
```

There really seems to be no other way than a try/catch.

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
