https://www.linuxfromscratch.org/

It looks like you should start from an existing Linux installation.\
The ISO seems to be only for older versions of the book.

https://www.linuxfromscratch.org/lfs/view/stable/

You probably need an internet connection to download all build tools that you need.

#### iv. Prerequisites

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
