A Makefile is a unix tool to compile software projects.

#### Why use makefiles?

Makefiles can detect which source files have changed and need to be recompiled.\
So not every file of the project has to be recompiled every time you make a change in one or two files.

#### installation

```
sudo pacman -S make
```

#### Makefile for podman containers

```
touch Makefile
```

It is important that you **need to use TABs** to indent: (spaces dont work)
```
build:
        podman build . -t mediawiki-1.40.0

run:
        podman run -d -p 8080:80 --name mediawiki-1.40.0-container mediawiki-1.40.0

clean:
        podman rmi -f mediawiki-1.40.0
```

Then you can build your container with `make build`, run it with `make run`, and remove the containers with `make clean`.
