## general info

#### installation

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

## usage

#### native lsp

https://neovim.io/doc/user/lsp.html

Create a file `${HOME}/.config/nvim/lsp/go.lua` with this content:
```
vim.lsp.config['gols'] = {
  -- Command and arguments to start the server.
  cmd = { 'gopls' },
  -- Filetypes to automatically attach to.
  filetypes = { 'go' },
}
```

Inside `nvim` you need to enable it:
```
:lua vim.lsp.enable('go')
```
NOTE: This string must be equal to the basename of the config file!\
In this case (`go.lua`).

You can check if it works with:
```
checkhealth vim.lsp
```

Now Autocompletion with CTRL+X, CTRL+O works in Go.\
And it is pretty fast.

However it does not do trigger `go fmt` on save and it does not use \
the thing that automatically fixes the imports.

#### how to install plugins

(https://github.com/junegunn/vim-plug)

Are there also `vim packages`?

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

#### How to install a bash language server? (with coc.nvim)

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

#### java language server (with coc.nvim)

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

There is a `coc-java` folder in `~/.config/coc/extensions/node_modules`

```
**Note**: You can manually download jdt.ls and extract the content to data
 22 folder of coc-java, get the folder path by `:echo coc#util#extension_root().'/coc-java-data/server'` in your vim.
```

```
cd ~/.config/coc/extensions/coc-java-data/server
wget https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
tar -xvf jdt-language-server-latest.tar.gz
```

=> and now it works! but it takes a second to load the completion!

#### coc usage

<kbd>ctrl + n</kbd> - select next suggestion \
<kbd>ctrl + p</kbd> - select previous suggestion

by default I can't find a way to accept the suggestions...\
but you can add this to your `init.vim`: (there is an example vim configuration on the github)

```
 """"""""""""
 " COC.NVIM "
 """"""""""""
  
 " Make <CR> to accept selected completion item or notify coc.nvim to format
 " <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
```
now you can accept suggestions with <kbd>enter</kbd>

There appear warning signs on the left hand site. But how to read them?\
**Hover** with the **cursor** over the highlighted word!!!

add this to `.vimrc`, so you can hit <kbd>shift+k</kbd> or upper case `K` to see the documentation of a function,\
when the cursor is on the function name:
```
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
```

## DIFFERENCES TO VIM

-------------------------------------------
keybindings and executing terminal commands
-------------------------------------------

If you import the keybindings from vim you should delete the "!clear" commands.
It creates unwanted characters in the output and you don't need to clear the terminal in nvim at this point.
