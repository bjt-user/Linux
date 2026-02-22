#### how to update aur packages?

```
yay --aur
```

Then just hit enter a couple of times.

#### remove an aur package

```
yay -Rnsc my_package
```

## troubleshooting

#### skipping build

`yay` might skip the build if it has the package binary already in the \
cache.\
Then the build might have been linked to an old library version and the \
binary will not work.

This will *make sure* that the package will be built:
```
yay -S my_package --rebuild
```
