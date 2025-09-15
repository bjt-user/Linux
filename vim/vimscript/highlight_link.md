## general info

`:h hi-link`

```
When you want to use the same highlighting for several syntax groups, you
can do this more easily by linking the groups into one common highlight
group, and give the color attributes only for that group.

To set a link:

    :hi[ghlight][!] [default] link {from-group} {to-group}

To remove a link:

    :hi[ghlight][!] [default] link {from-group} NONE
```

#### default

```
Normally a highlight group is added once when starting up.
This sets the default values for the highlighting.
After that, you can use additional highlight commands to change the arguments
that you want to set to non-default values.
```
