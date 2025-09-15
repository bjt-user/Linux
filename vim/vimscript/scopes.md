## general info

`:h scopes`

```
vim9-scopes
When using :function or :def to specify a new function at the script level
in a Vim9 script, the function is local to the script.  Like prefixing "s:" in
legacy script.
To define a global function or variable the "g:" prefix must be used.
For functions in a script that is to be imported and in an autoload
script "export" needs to be used for those to be used elsewhere.
        def ThisFunction()          # script-local
        def g:ThatFunction()        # global
        export def Function()       # for import and import autoload
```
