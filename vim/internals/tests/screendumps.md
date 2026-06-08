#### whitespace

Screendumps require a space at the end of the file.\
But vim or helix cannot add the space at the end.\
Adding a space at the end will not work.\
After saving the file, the space will be gone.

The only way seems to be to copy the failed file from `testdir/failed` to \
`testdir/dumps`.\
And even this might fail.

You have to `mv` or `cp` without using the `.` at the end.\
You have to write the entire file name by hand!\
This way the trailing space will remain!
