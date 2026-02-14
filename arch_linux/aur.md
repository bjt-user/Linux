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
