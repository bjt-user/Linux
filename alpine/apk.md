#### show files that were installed by a package

```
# apk info -L check
check-0.15.2-r5 contains:
usr/bin/checkmk
usr/lib/libcheck.so.0
usr/lib/libcheck.so.0.0.0
```

#### install package with header files

Normal packages do NOT include header files.

If you need header files, there should be a package with \
the same name and a `-dev` postfix.

`check` -> `check-dev`

```
# apk info -L check-dev
check-dev-0.15.2-r5 contains:
usr/include/check.h
usr/include/check_stdint.h
usr/lib/libcheck.so
usr/lib/pkgconfig/check.pc
usr/share/aclocal/check.m4
```
