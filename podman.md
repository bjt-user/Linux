## installation

On Debian Sid it worked by just doing
```
sudo apt install podman
```
and then test
```
podman run hello-world
```

***

#### Containerfile

You can call your "Dockerfiles" `Containerfile`.

Then do this inside the container:
```
podman build . -t myimagename
```

```
podman run -it --name [givecontaineraname] [imagename]
```

But after exiting that initial instance I cant get back into the cli of the container with
```
podman start -i containername
```

But you can get into the cli with:
```
podman attach containername
```

To start and go into the container run this:
```
podman start -ia containername
```
But when I exit out of that container, changes made inside the container do not persist.\
When I detach the container with the configured detach keys, and then attach it again, the changes do persist.

see how an image was created: (in an ugly format)
```
podman history docker.io/ubuntu/bind9 --no-trunc
```
(probably not consistent because an image can be flattened)

#### COPY in Containerfiles

Works good to put a local folder in your container:
```
FROM alpine

RUN apk add vim

COPY ./activemq /opt/activemq

# to build:
# podman build . -t "amq-copy-image"
# to run:
# podman run -it --name amq-copy-container amq-copy-image
```
(the folder `activemq` is in the same dir as the `Containerfile`)

#### configuration

to make <kbd>ctrl</kbd>+<kbd>p</kbd> work to go back in bash history:
```
sudo vim /usr/share/containers/containers.conf
``` 
replace
`detach_keys = "ctrl-p,ctrl-q"`
with
`detach_keys = "ctrl-z,ctrl-z"`

## troubleshooting

### uid/gid errors

``` 
Error: copying system image from manifest list: writing blob: adding layer with blob "sha256:8921db27df2831fa6eaa85321205a2470c669b855f3ec95d5a3c2b46de0442c9": processing tar file(potentially insufficient UIDs or GIDs available in user namespace (requested 0:42 for /etc/shadow): Check /etc/subuid and /etc/subgid if configured locally and run podman-system-migrate: lchown /etc/shadow: invalid argument): exit status 1
```

Maybe my `uid` is too high? (active directory user)
```
$ echo $UID
1808613262
```

### shortname "archlinux" not found

You can configure short names as seen here: https://wiki.archlinux.org/title/Podman\
or just use the full path to the image:
```
FROM docker.io/archlinux/archlinux
```

***
