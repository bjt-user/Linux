#### installation

On Debian Sid it worked by just doing
```
sudo apt install podman
```
and then test
```
podman run hello-world
```

***

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

#### configuration

to make <kbd>ctrl</kbd>+<kbd>p</kbd> work to go back in bash history:
```
sudo vim /usr/share/containers/containers.conf
``` 
replace
`detach_keys = "ctrl-p,ctrl-q"`
with
`detach_keys = "ctrl-z,ctrl-z"`
