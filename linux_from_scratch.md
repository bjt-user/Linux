https://www.linuxfromscratch.org/

It looks like you should start from an existing Linux installation.\
The ISO seems to be only for older versions of the book.

https://www.linuxfromscratch.org/lfs/view/stable/

You probably need an internet connection to download all build tools that you need.

***

#### iv. Prerequisites

two good resources to read:\
http://www.tldp.org/HOWTO/Software-Building-HOWTO.html

http://moi.vonos.net/linux/beginners-installing-from-source/

https://tldp.org/HOWTO/Software-Building-HOWTO-2.html

https://tldp.org/HOWTO/Software-Building-HOWTO-3.html

Invoking make usually involves just typing make. This generally builds all the necessary executable files for the package in question. However, make can also do other tasks, such as installing the files in their proper directories (make install) and removing stale object files (make clean). Running make -n permits previewing the build process, as it prints out all the commands that would be triggered by a make, without actually executing them.

Be aware that xmkmf and make may need to be invoked as root, especially when doing a make install to move the binaries over to the /usr/bin or /usr/local/bin directories. Using make as an ordinary user without root privileges will likely result in write access denied error messages because you lack write permission to system directories. Check also that the binaries created have the proper execute permissions for you and any other appropriate users.

Note that if you run configure, it should be invoked as ./configure to ensure that the correct configure script in the current directory is called.

Installing the freshly built binaries into the appropriate system directories is usually a matter of running make install as root. The usual directories for system-wide binaries on modern Linux distributions are /usr/bin, /usr/X11R6/bin, and /usr/local/bin. The preferred directory for new packages is /usr/local/bin, as this will keep separate binaries not part of the original Linux installation.

Packages originally targeted for commercial versions of UNIX may attempt to install in the /opt or other unfamiliar directory. This will, of course, result in an installation error if the intended installation directory does not exist. The simplest way to deal with this is to create, as root, an /opt directory, let the package install there, then add that directory to the PATH environmental variable. Alternatively, you may create symbolic links to the /usr/local/bin directory.

Your general installation procedure will therefore be:

- Read the README file and other applicable docs.
- Run xmkmf -a, or the INSTALL or configure script.
- Check the Makefile.
- If necessary, run make clean, make Makefiles, make includes, and make depend.
- Run make.
- Check file permissions.
- If necessary, run make install.

Notes:
- You would not normally build a package as root. Doing an su to root is only necessary for installing the compiled binaries into system directories.
- After becoming familiar with make and its uses, you may wish to add additional optimization options passed to gcc in the standard Makefile included or created in the package you are installing. Some of these common options are -O2, -fomit-frame-pointer, -funroll-loops, and -mpentium (if you are running a Pentium cpu). Use caution and good sense when modifying a Makefile! 
- After the make creates the binaries, you may wish to strip them. The strip command removes the symbolic debugging information from the binaries, and reduces their size, often drastically. This also disables debugging, of course.

The link provides 5 examples of programs that are being build from source.\
It also has some detailed explanation of different problems that may come up during a build from source.

#### check your downloaded files: md5sum

Both the “http” and “ftp” network protocols can be intercepted by criminals or other undesirable parties who can then modify data as it downloads. Data can also potentially be corrupted by accident while underway (though this is not common). And when using a mirror-site, it is possible that someone has modified the files there (ie that the files on the mirror are not the same as those from the original publisher). It is therefore a good idea to verify that what you downloaded is what the original publisher intended.

Many sites provide an md5sum file for each archive file, which holds a checksum of the contents of the file; sometimes a single md5sums file holds checksums for a number of other files. You should always obtain an md5sums file from the original site, never a mirror. And you should download it via the secure https protocol if possible. The unix md5sum commandline tool can then be used to compute the checksum of the big archive file, and compare it to the expected values to ensure the contents are as expected.

To compute the sum of a single file:

   md5sum file-to-check

and “by hand” verify the output of this application against the expected value. If the value is in a webpage, you can open the “find” dialog on that page and copy-and-paste the value output by the md5sum program. The “find” will match only if the values are the same.

If the software provider provides an md5sums file which has a list of (filename, checksum) pairs, then you can run:

   md5sum -c md5sums-file

which will look in your local system for every file listed in the md5sums-file, compute its checksum, and report an error if it is not the expected value.

Some software providers sign archive files instead of (or as well as) providing an md5 checksum. In this case you should:

-download the provider’s public key from their website (using https where possible)
- download the “signature file” for the archive-file; this will be a small file which has the same base name as the downloaded file, with suffix “.sig” or “.asc”
- perform the following steps

needed only once for each key, ie each "publisher"
```
gpg --import {public-key}

gpg --verify {signature-file-name}
```
The verify step decrypts the signature-file, revealing a checksum; it then runs a checksum algorithm over the real file and checks that they are the same. Obviously, the “gpg” application needs to be installed locally.

In general, it is best to perform all steps except “make install” as a normal system user, not root. This avoids mistakes and possibly some attacks (though as the install step is done as root that isn’t much protection). However installing software into the global /bin or /usr directories usually requires administration privileges (unless you’re using a “user-based package manager” or similar rare setup).

#### configure

Many software packages therefore come with a shell-script named “configure” and a template makefile named “Makefile.in”.\
The configure script takes a list of configuration options on the commandline, and converts the template makefile into a real makefile customised for the local computer and the installer’s wishes.

By the way: the “configure” script is auto-generated by software called autotools, but that doesn’t matter to the person using it.

Some projects provide a makefile but no “configure” script; in this case the “configure” step above can be omitted. \
Either the application is simple enough that it doesn’t need it, or the software developers have built more logic into the hand-written makefile.

#### cmake

Some projects use cmake as their build-tool. cmake works somewhat like configure (see above); it generates a makefile whose content depends on the options passed to the cmake command, and on features of the local system. The steps require to build a cmake-based package are identical to the “configure/make” examples above except that the configure step is replaced by:

cmake . -DCMAKE_BUILD_TYPE=Release {some options ...}

#### faq and mailing lists

https://www.linuxfromscratch.org/lfs/view/stable/chapter01/resources.html

and how to ask for help: \
https://www.linuxfromscratch.org/lfs/view/stable/chapter01/askforhelp.html


#### troubleshooting

why creating a new partition?\
you usually dont have any unpartitioned space in your running linux distro,\
so this will not work.\
=> at least in `qemu` you can add a disk\
view -> details -> add hardware -> storage > select 10GB and click finish

what is a `wget-list`? the command doesnt work...
