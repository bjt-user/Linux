https://wiki.archlinux.org/title/Arch_User_Repository

#### install package from aur

```
sudo pacman -S base-devel
```

```
git clone https://aur.archlinux.org/r8168.git
```

```
cd package_name
```

Check the `PKGBUILD` for malicious stuff:
```
bat PKGBUILD
```

```
makepkg -s --skipinteg
```
(`-s` will install dependencies through pacman) \
(`--skipinteg` will skip `pgp` checks which will most likely fail)

Install the package: (not necessary if you use `-i` flag with `makepkg`)
```
sudo pacman -U r8168-8.055.00-1-x86_64.pkg.tar.zst
```

View your successfully installed package:
```
sudo pacman -Qi r8168
```

#### push pkg to aur

You first need to register at aur.archlinux.org.\
Then you need to setup ssh keys.\
(https://wiki.archlinux.org/title/AUR_submission_guidelines#Authentication)

You can initialize a new local repo like this:
```
git -c init.defaultBranch=main clone ssh://aur@aur.archlinux.org/mdtoc.git
```

Then build your package and probably just push the commit.

FAIL:
```
$ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 8 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 1.83 KiB | 1.83 MiB/s, done.
Total 8 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: error: pushing to a branch other than master is restricted
remote: error: hook declined to update refs/heads/main
To ssh://aur.archlinux.org/mdtoc.git
 ! [remote rejected] main -> main (hook declined)
error: failed to push some refs to 'ssh://aur.archlinux.org/mdtoc.git'
```

It needs to be the `master` branch.

A `git push` to the master branch worked.

And immediatelly afterwards the package could be found on "aur.archlinux.org".
