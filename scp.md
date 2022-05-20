#### get a folder from another system

Get the folder `/home/bf/dotfiles` from the server `example-oracle`.\
And put it into the folder `dotfiles` on the current system.\
Maybe just do `.` as a last argument because otherwise you have a unnecessary nested folder.
```
scp -r bf@example-oracle:/home/bf/dotfiles dotfiles/.
```
