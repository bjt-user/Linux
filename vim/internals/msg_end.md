## general info

`msg_end()` had cleared everything under the status bar.\
Which was not desirable.

Does it always behave like this?\
=> No, it does not always do that...

It is the call of `out_flush();` inside `msg_end()` that clears the message \
screen.
