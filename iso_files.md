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


`Dockerfile`:
```
FROM alpine:latest

RUN apk update
RUN apk add vim
```

```
docker buildx build . -t alpine-vim
```

```
docker run -td --name alpine-vim-container alpine-vim
```

Now I have a running container:
```
$ docker ps
CONTAINER ID   IMAGE        COMMAND     CREATED         STATUS         PORTS     NAMES
60850d7411d3   alpine-vim   "/bin/sh"   4 minutes ago   Up 4 minutes             alpine-vim-container
```

```
docker export alpine-vim-container -o alpine-vim-container.tar
```

extract tarball:
```
mkdir rootfs
tar -xvf alpine-vim-container.tar -C rootfs
```

create iso: (FAIL)
```
$ mkisofs -V "container_iso" -R rootfs/ -o container.iso
Setting input-charset to 'UTF-8' from locale.
mkisofs: No such file or directory. Invalid node - '-o'.
```

Wrong order of flags! `-o` needs to come first!

```
mkisofs -o container.iso -V "container_iso" -R rootfs/
```

Now I have an ISO file:
```
$ file container.iso
container.iso: ISO 9660 CD-ROM filesystem data 'container_iso'
```

Now test if you can boot from the iso in qemu or libvirt.

```
$ virt-install --cdrom container.iso --name container-iso-try
ERROR
--os-variant/--osinfo OS name is required, but no value was
set or detected.

This is now a fatal error. Specifying an OS name is required
for modern, performant, and secure virtual machine defaults.
```

```
virt-install --cdrom container.iso --name container-iso-try --osinfo "alpinelinux3.20"
```
Now `virt-viewer` opened, but the iso does not seem to be bootable.

I might need this flag: (and get a boot image from somewhere)
```
-G generic_boot_image
Specifies the path and filename of the generic boot image to be used when making a generic bootable CD.  The generic_boot_image will be  placed
on  the  first  16  sectors of the CD. The first 16 sectors are the sectors that are located before the ISO-9660 primary volume descriptor.  If
this option is used together with the -sparc-boot option, the Sun disk label will overlay the first 512 bytes of the generic boot image.
```
