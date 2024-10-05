https://www.baeldung.com/linux/iso-quick-extract

To extract an ISO you can use `mount` or use special tools.

## bsdtar

#### installation (arch linux)

`bsdtar` is part of the `core/libarchive` package.

#### list contents of an iso file

```
bsdtar -tf alpine-standard-3.20.1-x86_64.iso
```

#### extract files from iso

```
bsdtar -xvf alpine-standard-3.20.1-x86_64.iso
```

It is interesting that the alpine image contains all the `.apk` packages.\
These are binary files.\
But there is a guide on how to build those yourself.\
And you can probably just add `.apk` packages to this image and then compress to iso again.
