List of all use flags with short description: https://www.gentoo.org/support/use-flags/

## usage

#### disable useflag for a specific package

```
echo "app-editors/vim -nls" >> /etc/portage/package.use/vim
```
Then the use flag `nls` will not be used when building vim.

#### temporarily set use flag

```
time USE="-nls" emerge gdb
```

## flags that could be removed

#### nls

> Add Native Language Support (using gettext - GNU locale utilities)

This one can probably safely removed globally if you want your programs only in english.
