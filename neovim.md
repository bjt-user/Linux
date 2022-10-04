```
sudo apt install neovim
```

Is opened with the command `nvim <file>`.

It should be possible to install language servers with coc.

#### config file (equivalent of .vimrc)

It is possible to load the content of .vimrc into neovim.\
But for the start I will use the standard neovim path for the user config file.

You have to create a nvim-Folder in ~/.config path.\
And then create a init.vim file.
`~/.config/nvim/init.vim`

This also tells you the path to the config file:
```
:help config
```

***
## HOW TO INSTALL PLUGINS

(https://github.com/junegunn/vim-plug)

#### with "vim-plug"

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
=> but the `:PlugInstall` is still not found

there is a `~/.local/share/nvim/site/autoload/plug.vim` file now

then I put this into `~/.config/nvim/init.vim`:
```
call plug#begin('~/.config/nvim/autoload/plugged')

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

call plug#end()
```

open `nvim` and type
```
:PlugInstall
```

=> then `autopairs` was installed and it worked

type
```
:PlugStatus
```
to see the status of the plugins


#### Add a plugin with vimplug

Put this into the `plugins.vim` file:
(it should close brackets automatically)

```
call plug#begin('~/.config/nvim/autoload/plugged')

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

call plug#end()
```

But before you can use the plugins, you have to source them.

Add the following line to `init.vim`
```
source $HOME/.config/nvim/vim-plug/plugins.vim
```
Now go into nvim with "nvim" command.
:P and press [TAB] key until you are at :PlugStatus.
:PlugStatus

It says that it didn't find auto-pairs. (because we didn't install them)
To install plugins type
:PlugInstall

=> and it works (closes ( [ or { automatically after the cursor)

commands for later usage:
:PlugUpdate to update plugins
:PlugClean to get rid of plugins you dont use anymore (probably those you deleted from the file)
:PlugUpgrade to upgrade vim-plug

#### manual?

https://stackoverflow.com/a/50122211/13253079

In Neovim, the directory structure follows the freedesktop's XDG Base Directory Specification.\
Your configuration file is in ~/.config/nvim/init.vim, but your plugins go into:

`~/.local/share/nvim/site/pack/*/start`

See `:h packages` (Vim 8.0 and Neovim) for more information.

this directory structure already exists:
```
cd ~/.local/share/nvim
```
so I create the rest:
```
mkdir -p site/pack/coc/start
cd site/pack/coc/start
git clone https://github.com/neoclide/coc.nvim.git
```

now I open nvim by typing `nvim` and get the following error:
```
[coc.nvim] build/index.js not found, please install dependencies and compile coc.nvim by: yarn install
```

to build that from source you have to use `yarn` and I dont know about that and it didnt work out of the box

***

#### How to install a bash language server?

```
sudo dnf install nodejs
```

Putting this into `~/.config/nvim/init.vim` worked:
```
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```

but `:PlugStatus` says:
```
coc.nvim: OK (not loaded)
```

The problem was, that I did not put the `call plug#begin('~/.config/nvim/autoload/plugged')` and \
`call plug#end()` around my plugins:
```
"""""""""""
" VIMPLUG "
"""""""""""

call plug#begin('~/.config/nvim/autoload/plugged')
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " Use release branch (recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
```
If this is in your `init.vim` both plugins are available and work.

```
:CocInstall coc-sh
```

=> it worked

how to see all installed LSPs:
```
:CocList extensions
```


    ? means invalid extension
    * means extension is activated
    + means extension is loaded
    - means extension is disabled

https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#manage-coc-extensions


You could also manage extensions in a config file\
https://github.com/neoclide/coc.nvim/wiki/Language-servers

***

#### java language server

It does not really work at the moment.\
I insatlled like this:
```
:CocInstall coc-java
```

```
[coc.nvim] jdt.ls not found, downloading...
```

```
[coc.nvim] Download jdt.ls failed, you can download it at https://download.eclipse.org/jdtls/snapshots/?d
```

Maybe proxy problem...

## DIFFERENCES TO VIM

-------------------------------------------
keybindings and executing terminal commands
-------------------------------------------

If you import the keybindings from vim you should delete the "!clear" commands.
It creates unwanted characters in the output and you don't need to clear the terminal in nvim at this point.

---------------
Multiline edits
---------------

To insert text in multiple lines at once do the following:
ctrl + v    : to go into visual block mode
go up or down with j/k to select multiple lines
I           : to go into insert mode on multiple lines (uppercase so shift+i)
ESC         : to go out of insert mode
Then the text should appear in multiple lines.
