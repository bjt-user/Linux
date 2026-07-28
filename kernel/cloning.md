#### cloning the torvalds kernel with --depth=1

```
$ time git clone --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li
nux.git
Cloning into 'linux'...
remote: Enumerating objects: 100395, done.
remote: Counting objects: 100% (100395/100395), done.
remote: Compressing objects: 100% (97453/97453), done.
remote: Total 100395 (delta 8073), reused 21954 (delta 1882), pack-reused 0 (from 0)
Receiving objects: 100% (100395/100395), 278.67 MiB | 6.11 MiB/s, done.
Resolving deltas: 100% (8073/8073), done.
Updating files: 100% (94851/94851), done.

real    1m24.024s
user    0m15.183s
sys     0m24.574s
```

#### TODO: cloning from a bundle

https://www.kernel.org/cloning-linux-from-a-bundle.html
