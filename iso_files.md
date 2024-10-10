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

## cdrtools

https://en.wikipedia.org/wiki/Cdrtools

The package `cdrtools` seems to contain useful binaries.\
For example the `genisoimage` binary.

```
$ sudo pacman -Fl cdrtools | grep "bin"
cdrtools usr/bin/
cdrtools usr/bin/btcflash
cdrtools usr/bin/cdda2mp3
cdrtools usr/bin/cdda2ogg
cdrtools usr/bin/cdda2wav
cdrtools usr/bin/cdrecord
cdrtools usr/bin/devdump
cdrtools usr/bin/genisoimage
cdrtools usr/bin/icedax
cdrtools usr/bin/isodebug
cdrtools usr/bin/isodump
cdrtools usr/bin/isoinfo
cdrtools usr/bin/isovfy
cdrtools usr/bin/mkhybrid
cdrtools usr/bin/mkisofs
cdrtools usr/bin/readcd
cdrtools usr/bin/readom
cdrtools usr/bin/rscsi
cdrtools usr/bin/scgcheck
cdrtools usr/bin/scgskeleton
cdrtools usr/bin/wodim
```

`genisoimage` is a symlink to `/usr/bin/mkisofs`:
```
$ ls -l /usr/bin/genisoimage
lrwxrwxrwx 1 root root 16 Jul 20 17:31 /usr/bin/genisoimage -> /usr/bin/mkisofs
```

```
man mkisofs
```

> mkisofs takes a snapshot of a given directory tree, and generates a binary image \
which will correspond to an ISO-9660 or Joliet/HFS/UDF filesystem when written to a block device.

#### TODO: create iso file from docker container

First, get the name or container ID of the running container:
```
docker ps
```

export root fs:
```
docker export <container_name_or_id> -o /path/to/output/container.tar
```

extract the tarball:
```
mkdir /path/to/extracted
tar -xvf /path/to/output/container.tar -C /path/to/extracted
```

3. Create an ISO from the extracted filesystem

You can use mkisofs (or genisoimage or xorriso, depending on your system) to create an ISO from the extracted directory:
```
mkisofs -o /path/to/output/container.iso -V "Container_Image" -R /path/to/extracted
```

-o: Output file for the ISO image.\
-V: Volume label for the ISO.\
-R: Use the Rock Ridge extensions, which preserve Unix file permissions and symlinks.
