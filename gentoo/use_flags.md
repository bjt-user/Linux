List of all use flags with short description: https://www.gentoo.org/support/use-flags/

## usage

#### disable useflag for a specific package

```
echo "app-editors/vim -nls" >> /etc/portage/package.use/vim
```
Then the use flag `nls` will not be used when building vim.
