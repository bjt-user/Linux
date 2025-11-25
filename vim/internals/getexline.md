## general info

```
/*
* Get an Ex command line for the ":" command.
*/
char_u *
getexline(
    int         c,              // normally ':', NUL for ":append"
    void        *cookie UNUSED,
    int         indent,         // indent for inside conditionals
    getline_opt_T options)
```

#### basic call graph

getexline -> getcmdline -> getcmdline_int

And `getcmdline_int` is a 900 line function.
