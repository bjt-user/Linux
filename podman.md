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
