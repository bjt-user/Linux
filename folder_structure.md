https://wiki.ubuntuusers.de/Verzeichnisstruktur/

Understanding the Linux folder structure
----------------------------------------

`/etc` folder is a central location for all your configuration files

`/proc` folder holds information about processes and the kernel.\
`man proc` says:
```
The  proc  filesystem  is a pseudo-filesystem which provides an interface to kernel data structures. 
It is commonly mounted at /proc.
Typically, it is mounted automatically by the system, but it can also be mounted manually using a command such as:

mount -t proc proc /proc

Most of the files in the proc filesystem are read-only, but some files are writable, allowing kernel variables to be changed.
...
```
Interesting files in the `/proc` folder:\
`cat cpuinfo` \
`cat meminfo` \

The folders in the `/proc` directory with numbers correspond to a process.\
The number is the process id. (compar with `ps -ef`)
Inside those folders are files like `cmdline` which contain the command with which the process was started.\
Or `environ` which is supposed to contain the environment variables for that process.\
The file `status` contains the name of the process, the state, process id and a lot of other stuff.

`/proc/net` contains information about the network.

***

Change directory to the "top" folder `/`:\
(useful because usually you start in `~` and `cd` takes you to `~` as well)
```
cd /
```
