#### detect the filetype

Create a `.vim` file in `~/.vim/ftdetect`.
```
~/.vim/ftdetect $ cat foofiletype.vim
au BufRead,BufNewFile *.foo setfiletype foo
```

Now you can open `.foo` files and it will be detected as a `foo` file.

This is the simplest logic to detect the filetype.\
Another way is to use the shebang.\
Or it seems that you can use the path of a file to determine its filetype.

#### show the filetype of the current buffer

```
:set filetype?
```

#### example from ansible-vim

https://github.com/pearofducks/ansible-vim/blob/master/ftdetect/ansible.vim

This will detect a file as a `yaml.ansible` file if it is inside of a `roles` dir or in a `tasks` dir,\
but not if it is in the root dir of a project.
