## general info

```
:h tabpage.txt
```

## usage

#### open files in tabs

When starting vim:
```
vim -p foo.txt bar.txt
```

Inside vim:\
Open a file in a new tab:
```
:tabnew <file>
```
or
```
:tabe <file>
```

#### close the current tab

```
:tabc
```
or just
```
:x
```

#### Go to the next tab
```
:tabn
```
or `gt` or `<C-PgUp>`

#### Go to the previous tab

```
:tabp
```
or `gT` or `<C-PgDn>`

> {count}gt       Go to tab page {count}.  The first tab page has number one.
