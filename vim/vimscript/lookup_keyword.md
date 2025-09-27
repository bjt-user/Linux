## general info

```
:h K
```

```
K
Run a program to lookup the keyword under the cursor.
The name of the program is given with the 'keywordprg' (kp) option (default is "man").
The keyword is formed of letters, numbers and the characters in 'iskeyword'.
The keyword under or right of the cursor is used.
The same can be done with the command
        :!{program} {keyword}
There is an example of a program to use in the tools
directory of Vim.
It is called "ref" and does a simple spelling check.
Special cases:
- If 'keywordprg' begins with ":" it is invoked as
  a Vim Ex command with [count].
- If 'keywordprg' is empty, the ":help" command is
  used. It's a good idea to include more characters
  in 'iskeyword' then, to be able to find more help.
- When 'keywordprg' is equal to "man" or starts with
  ":", a [count] before "K" is inserted after
  keywordprg and before the keyword.  For example,
  using "2K" while the cursor is on "mkdir", results
  in:
        !man 2 mkdir
```

## usage

#### show keywordprg

```
set keywordprg?
```
