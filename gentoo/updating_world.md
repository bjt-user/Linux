```
time sudo emerge -a -v --update --deep --changed-use @world
```

Took 1 hour on a system that was created one day before.

https://wiki.gentoo.org/wiki/Gentoo_Cheat_Sheet#Package_upgrades

> The --newuse may be used in place of--changed-use to make sure that all package use flags reflect the current state of those in the Gentoo repository, though this will entail more rebuilds.
