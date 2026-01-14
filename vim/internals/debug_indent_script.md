## indentation tests

In `runtime/indent`:
- testdir/yaml.in is the input
- testdir/yaml.ok is the expected output

#### run indent tests

```
cd runtime/indent
make clean
make test
```
## yaml indentation breakage

This did not really work:
```
./vim -u ../runtime/indent/yaml.vim foo_playbook.yaml
```
=> `gg=G` will destroy playbook indentation

Can I `git bisect` to a working version?

I first need to find a working commit.

Old commits seem to be broken as well...

No, `vim-9.1.1975-1` is at least not as broken as `vim-9.1.2077-1`.\
I had to test that by downgrading pacman vim versions.
