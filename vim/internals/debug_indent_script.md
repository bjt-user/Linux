## yaml indentation breakage

```
./vim -u ../runtime/indent/yaml.vim foo_playbook.yaml
```

=> `gg=G` will destroy playbook indentation

Can I `git bisect` to a working version?

I first need to find a working commit.

Old commits seem to be broken as well...
